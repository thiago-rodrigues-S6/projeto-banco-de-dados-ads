-- =====================================================================
-- Palazio del Chef | Consultas, UPDATE e DELETE (MySQL 8.0)
-- Banco: palazio_del_chef (banco-de-dados-palazio.sql)
-- Este arquivo reúne duas partes, na ordem em que devem ser executadas:
--   PARTE 1: consultas (C01 a C12) e auditorias (A01 a A07), só leitura.
--   PARTE 2: UPDATE e DELETE (U01 a U04, D01 a D04), dentro de uma transação
--            que termina em ROLLBACK, então o banco volta ao estado original.
-- Rodar a Parte 1 antes da Parte 2 mantém os resultados das consultas válidos.
-- =====================================================================
USE palazio_del_chef;


-- #####################################################################
-- PARTE 1 | CONSULTAS
-- #####################################################################


-- C01 | Comanda do pedido 2: o que foi pedido, por quem e em qual mesa (JOIN em 4 tabelas)
-- Atende: RN01, RN02, RN04
SELECT p.num_pedido, p.nmr_mesa AS mesa, a.nome_atendente AS atendente,
       pr.nome_produto, i.qt_produto, i.preco_unitario,
       i.qt_produto * i.preco_unitario AS subtotal
  FROM pedido p
  JOIN atendente   a  ON a.id_atendente  = p.id_atendente
  JOIN item_pedido i  ON i.num_pedido    = p.num_pedido
  JOIN produto     pr ON pr.codigo_produto = i.codigo_produto
 WHERE p.num_pedido = 2 AND i.status = 'ativo'
 ORDER BY pr.nome_produto;

-- C02 | Valor total de cada pedido, sem os itens cancelados (agregação)
-- Atende: RN20
SELECT p.num_pedido, p.data_hora_pedido, COUNT(*) AS itens, SUM(i.qt_produto) AS unidades,
       SUM(i.qt_produto * i.preco_unitario) AS valor_total
  FROM pedido p
  JOIN item_pedido i ON i.num_pedido = p.num_pedido
 WHERE i.status = 'ativo'
 GROUP BY p.num_pedido, p.data_hora_pedido
 ORDER BY valor_total DESC
 LIMIT 10;

-- C03 | Faturamento por atendente: pedidos, ticket médio e total vendido
-- Atende: RN01
SELECT a.nome_atendente, COUNT(DISTINCT p.num_pedido) AS pedidos,
       SUM(i.qt_produto * i.preco_unitario) AS vendido,
       ROUND(SUM(i.qt_produto * i.preco_unitario) / COUNT(DISTINCT p.num_pedido), 2) AS ticket_medio
  FROM atendente a
  JOIN pedido p      ON p.id_atendente = a.id_atendente
  JOIN item_pedido i ON i.num_pedido   = p.num_pedido AND i.status = 'ativo'
 GROUP BY a.id_atendente, a.nome_atendente
 ORDER BY vendido DESC;

-- C04 | Os 10 produtos mais vendidos, com setor e participação na receita (função de janela)
-- Atende: RN03, RN05
SELECT pr.nome_produto, s.nome_setor, SUM(i.qt_produto) AS unidades,
       SUM(i.qt_produto * i.preco_unitario) AS receita,
       ROUND(100 * SUM(i.qt_produto * i.preco_unitario)
             / SUM(SUM(i.qt_produto * i.preco_unitario)) OVER (), 1) AS pct_receita
  FROM item_pedido i
  JOIN produto pr ON pr.codigo_produto = i.codigo_produto
  JOIN setor   s  ON s.id_setor        = pr.id_setor
 WHERE i.status = 'ativo'
 GROUP BY pr.codigo_produto, pr.nome_produto, s.nome_setor
 ORDER BY receita DESC
 LIMIT 10;

-- C05 | Vendas por setor: Cozinha x Bar
-- Atende: RN05, RN10
SELECT s.nome_setor, COUNT(DISTINCT i.num_pedido) AS pedidos_com_itens_do_setor,
       SUM(i.qt_produto) AS unidades, SUM(i.qt_produto * i.preco_unitario) AS receita
  FROM item_pedido i
  JOIN produto pr ON pr.codigo_produto = i.codigo_produto
  JOIN setor   s  ON s.id_setor        = pr.id_setor
 WHERE i.status = 'ativo'
 GROUP BY s.id_setor, s.nome_setor;

-- C06 | Recebimentos por forma de pagamento (dinheiro, crédito, débito, Pix)
-- Atende: RN06, RN21
SELECT f.descricao AS forma, COUNT(*) AS pagamentos, SUM(pg.valor_pago) AS total_recebido,
       ROUND(100 * SUM(pg.valor_pago) / SUM(SUM(pg.valor_pago)) OVER (), 1) AS pct
  FROM pagamento pg
  JOIN forma_pagamento f ON f.id_forma_pagamento = pg.id_forma_pagamento
 GROUP BY f.id_forma_pagamento, f.descricao
 ORDER BY total_recebido DESC;

-- C07 | Pedidos ainda não quitados: total, pago e saldo a receber (LEFT JOIN + HAVING)
-- Atende: RN06, RN20
SELECT t.num_pedido, p.nmr_mesa AS mesa, t.valor_total,
       COALESCE(pg.pago, 0) AS pago, t.valor_total - COALESCE(pg.pago, 0) AS saldo
  FROM (SELECT num_pedido, SUM(qt_produto * preco_unitario) AS valor_total
          FROM item_pedido WHERE status = 'ativo' GROUP BY num_pedido) t
  JOIN pedido p ON p.num_pedido = t.num_pedido
  LEFT JOIN (SELECT num_pedido, SUM(valor_pago) AS pago FROM pagamento GROUP BY num_pedido) pg
         ON pg.num_pedido = t.num_pedido
 GROUP BY t.num_pedido, p.nmr_mesa, t.valor_total, pg.pago
HAVING saldo <> 0
 ORDER BY saldo DESC;

-- C08 | Itens cancelados: produto, motivo e quanto deixou de ser vendido
-- Atende: RN16, RN17
SELECT i.num_pedido, pr.nome_produto, i.qt_produto, i.qt_produto * i.preco_unitario AS valor_cancelado,
       i.motivo_cancelamento, i.data_hora_cancelamento
  FROM item_pedido i
  JOIN produto pr ON pr.codigo_produto = i.codigo_produto
 WHERE i.status = 'cancelado'
 ORDER BY i.data_hora_cancelamento;

-- C09 | Insumos abaixo do estoque mínimo e quanto falta para repor
-- Atende: RN07, RN24
SELECT nome_insumo, qt_insumo, qt_minima_insumo, unidade_insumo,
       qt_minima_insumo - qt_insumo AS falta_para_o_minimo
  FROM insumo
 WHERE qt_insumo < qt_minima_insumo
 ORDER BY falta_para_o_minimo DESC;

-- C10 | Compras por fornecedor: notas, itens e valor comprado (considera o desconto)
-- Atende: RN25, RN26, RN27
SELECT f.razao_social, COUNT(DISTINCT n.id_nota_compra) AS notas, COUNT(c.id_compra) AS itens,
       ROUND(SUM(c.quantidade * c.valor_unitario - COALESCE(c.desconto, 0)), 2) AS valor_comprado
  FROM fornecedor f
  JOIN nota_fiscal_compra n ON n.id_fornecedor = f.id_fornecedor
  JOIN compra c             ON c.id_nota_compra = n.id_nota_compra
 GROUP BY f.id_fornecedor, f.razao_social
 ORDER BY valor_comprado DESC;

-- C11 | Produtos do cardápio sem nenhum pedido no período (subconsulta NOT EXISTS; são 174 de 266, lista limitada a 15)
-- Atende: RN03 (apoio à decisão: cardápio sem giro)
SELECT pr.codigo_produto, pr.nome_produto, pr.preco_atual
  FROM produto pr
 WHERE NOT EXISTS (SELECT 1 FROM item_pedido i WHERE i.codigo_produto = pr.codigo_produto)
 ORDER BY pr.nome_produto
 LIMIT 15;

-- C12 | Produtos com preço acima da média do seu setor (subconsulta correlacionada; lista limitada a 15)
-- Atende: RN03, RN05
SELECT pr.nome_produto, s.nome_setor, pr.preco_atual
  FROM produto pr
  JOIN setor s ON s.id_setor = pr.id_setor
 WHERE pr.preco_atual > (SELECT AVG(p2.preco_atual) FROM produto p2 WHERE p2.id_setor = pr.id_setor)
 ORDER BY s.nome_setor, pr.preco_atual DESC
 LIMIT 15;

-- ---------------------- Consultas de auditoria (esperado: 0 linhas) ----------------------

-- A01 | Bebida alcoólica em pedido sem maioridade confirmada
-- Atende: RN18, RN19, RN23
SELECT DISTINCT p.num_pedido, pr.nome_produto
  FROM pedido p
  JOIN item_pedido i ON i.num_pedido = p.num_pedido
  JOIN produto pr    ON pr.codigo_produto = i.codigo_produto
 WHERE pr.bebida_alcoolica = 1 AND p.maioridade_confirmada = 0;

-- A02 | Pagamentos que ultrapassam o total do pedido
-- Atende: RN20
SELECT t.num_pedido, t.valor_total, pg.pago
  FROM (SELECT num_pedido, SUM(qt_produto * preco_unitario) AS valor_total
          FROM item_pedido WHERE status = 'ativo' GROUP BY num_pedido) t
  JOIN (SELECT num_pedido, SUM(valor_pago) AS pago FROM pagamento GROUP BY num_pedido) pg
    ON pg.num_pedido = t.num_pedido
 WHERE pg.pago > t.valor_total;

-- A03 | Nota fiscal com valor diferente do total do pedido
-- Atende: RN22
SELECT nf.num_pedido, nf.numero_nota, nf.valor_total AS valor_nota, t.valor_total AS valor_pedido
  FROM nota_fiscal nf
  JOIN (SELECT num_pedido, SUM(qt_produto * preco_unitario) AS valor_total
          FROM item_pedido WHERE status = 'ativo' GROUP BY num_pedido) t
    ON t.num_pedido = nf.num_pedido
 WHERE nf.valor_total <> t.valor_total;

-- A04 | Pagamento ligado à nota fiscal de outro pedido
-- Atende: RN29
SELECT pg.id_pagamento, pg.num_pedido AS pedido_do_pagamento, nf.num_pedido AS pedido_da_nota
  FROM pagamento pg
  JOIN nota_fiscal nf ON nf.id_nota_fiscal = pg.id_nota_fiscal
 WHERE nf.num_pedido <> pg.num_pedido;

-- A05 | Item cancelado sem motivo, ou item ativo com dados de cancelamento
-- Atende: RN17
SELECT num_pedido, codigo_produto, status
  FROM item_pedido
 WHERE (status = 'cancelado' AND (motivo_cancelamento IS NULL OR data_hora_cancelamento IS NULL))
    OR (status = 'ativo'     AND (motivo_cancelamento IS NOT NULL OR data_hora_cancelamento IS NOT NULL));

-- A06 | Preço do item diferente do preço atual do produto (informativo: o preço do pedido é histórico)
-- Atende: RN04
SELECT COUNT(*) AS itens_com_preco_diferente_do_cadastro
  FROM item_pedido i
  JOIN produto pr ON pr.codigo_produto = i.codigo_produto
 WHERE i.preco_unitario <> pr.preco_atual;

-- A07 | Nota fiscal de compra com valor_total diferente da soma das compras (quantidade x valor unitário - desconto)
-- Atende: RN26, RN27
SELECT n.id_nota_compra, n.valor_total AS valor_nota, x.soma_compras
  FROM nota_fiscal_compra n
  JOIN (SELECT id_nota_compra, ROUND(SUM(quantidade * valor_unitario - COALESCE(desconto, 0)), 2) AS soma_compras
          FROM compra GROUP BY id_nota_compra) x ON x.id_nota_compra = n.id_nota_compra
 WHERE n.valor_total <> x.soma_compras;


-- #####################################################################
-- PARTE 2 | UPDATE E DELETE
-- #####################################################################

-- Banco: palazio_del_chef (banco-de-dados-palazio.sql)
-- Cada comando traz a situação de negócio, a conferência ANTES e a
-- conferência DEPOIS. Tudo roda dentro de uma transação que termina em
-- ROLLBACK: o banco volta ao estado original e as consultas e os slides
-- continuam valendo. Para gravar de verdade, troque o ROLLBACK final por COMMIT.

START TRANSACTION;

-- ---------------------------------------------------------------------
-- U01 | Reajustar em 10% o preço do chopp (produto 266)
-- Atende: preço atual do produto muda; o item de pedido já lançado mantém
-- o preço da época da venda (preco_unitario).
-- ---------------------------------------------------------------------
SELECT codigo_produto, nome_produto, preco_atual AS preco_antes
FROM produto WHERE codigo_produto = 266;

UPDATE produto
SET preco_atual = ROUND(preco_atual * 1.10, 2)
WHERE codigo_produto = 266;

SELECT codigo_produto, nome_produto, preco_atual AS preco_depois
FROM produto WHERE codigo_produto = 266;

-- O histórico não muda: itens já vendidos continuam com o preço antigo.
SELECT COUNT(*) AS itens_com_preco_diferente_do_cadastro
FROM item_pedido i JOIN produto p USING (codigo_produto)
WHERE i.preco_unitario <> p.preco_atual;

-- ---------------------------------------------------------------------
-- U02 | Trocar o pedido 48 da mesa 11 para a mesa 12
-- Atende: pedido continua com atendente e mesa válidos (chave estrangeira).
-- ---------------------------------------------------------------------
SELECT num_pedido, nmr_mesa AS mesa_antes FROM pedido WHERE num_pedido = 48;

UPDATE pedido SET nmr_mesa = 12 WHERE num_pedido = 48;

SELECT num_pedido, nmr_mesa AS mesa_depois FROM pedido WHERE num_pedido = 48;

-- ---------------------------------------------------------------------
-- U03 | Repor 10 kg de queijo mussarela após uma compra (insumo 42)
-- Atende: o insumo sai da lista de estoque abaixo do mínimo (consulta C09).
-- ---------------------------------------------------------------------
SELECT nome_insumo, qt_insumo AS antes, qt_minima_insumo AS minimo
FROM insumo WHERE id_insumo = 42;

UPDATE insumo SET qt_insumo = qt_insumo + 10 WHERE id_insumo = 42;

SELECT nome_insumo, qt_insumo AS depois, qt_minima_insumo AS minimo
FROM insumo WHERE id_insumo = 42;

-- ---------------------------------------------------------------------
-- U04 | Cancelar um item do pedido 48, registrando o motivo
-- Atende: cancelamento com motivo e data; o item cancelado sai do total.
-- ---------------------------------------------------------------------
SELECT codigo_produto, status, motivo_cancelamento
FROM item_pedido WHERE num_pedido = 48 AND codigo_produto = 254;

UPDATE item_pedido
SET status = 'cancelado',
    motivo_cancelamento = 'Cliente desistiu do item',
    data_hora_cancelamento = NOW()
WHERE num_pedido = 48 AND codigo_produto = 254;

SELECT codigo_produto, status, motivo_cancelamento
FROM item_pedido WHERE num_pedido = 48 AND codigo_produto = 254;

SELECT SUM(qt_produto * preco_unitario) AS total_pedido_48_sem_cancelados
FROM item_pedido WHERE num_pedido = 48 AND status = 'ativo';

-- ---------------------------------------------------------------------
-- D01 | Remover um item lançado por engano do pedido 50 (ainda em aberto)
-- ---------------------------------------------------------------------
SELECT COUNT(*) AS itens_antes FROM item_pedido WHERE num_pedido = 50;

DELETE FROM item_pedido WHERE num_pedido = 50 AND codigo_produto = 69;

SELECT COUNT(*) AS itens_depois FROM item_pedido WHERE num_pedido = 50;

-- ---------------------------------------------------------------------
-- D02 | Excluir do cardápio um produto que nunca foi pedido (produto 90)
-- O NOT EXISTS protege o histórico: produto com pedido não é excluído.
-- ---------------------------------------------------------------------
SELECT COUNT(*) AS produtos_antes FROM produto;

DELETE FROM produto
WHERE codigo_produto = 90
  AND NOT EXISTS (SELECT 1 FROM item_pedido i WHERE i.codigo_produto = produto.codigo_produto);

SELECT COUNT(*) AS produtos_depois FROM produto;

-- ---------------------------------------------------------------------
-- D03 | Excluir o pedido 50 inteiro (em aberto, sem pagamento nem nota)
-- Ordem obrigatória por causa das chaves estrangeiras: primeiro os itens,
-- depois o pedido. A condição NOT EXISTS impede apagar pedido já pago.
-- ---------------------------------------------------------------------
SELECT COUNT(*) AS pedidos_antes FROM pedido;

DELETE FROM item_pedido
WHERE num_pedido = 50
  AND NOT EXISTS (SELECT 1 FROM pagamento pg WHERE pg.num_pedido = 50);

DELETE FROM pedido
WHERE num_pedido = 50
  AND NOT EXISTS (SELECT 1 FROM item_pedido i WHERE i.num_pedido = 50)
  AND NOT EXISTS (SELECT 1 FROM pagamento pg WHERE pg.num_pedido = 50);

SELECT COUNT(*) AS pedidos_depois FROM pedido;

-- ---------------------------------------------------------------------
-- D04 | (Demonstração de integridade, comentada porque gera erro)
-- Apagar um pedido que tem itens e pagamentos é bloqueado pelo banco:
--   DELETE FROM pedido WHERE num_pedido = 1;
-- Resultado esperado: Error 1451, a foreign key constraint fails
-- (fk_item_pedido_pedido). É a garantia de integridade referencial.
-- ---------------------------------------------------------------------

-- Desfaz tudo (troque por COMMIT para gravar as alterações).
ROLLBACK;

-- Conferência: o banco voltou ao estado original (50 pedidos, 266 produtos).
SELECT (SELECT COUNT(*) FROM pedido)  AS pedidos,
       (SELECT COUNT(*) FROM produto) AS produtos,
       (SELECT preco_atual FROM produto WHERE codigo_produto = 266) AS preco_chopp;
