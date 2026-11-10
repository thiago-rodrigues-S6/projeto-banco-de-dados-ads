-- =====================================================================
-- Palazio del Chef | Consultas SQL (MySQL 8.0)
-- Banco: palazio_del_chef (banco-de-dados-palazio2.sql)
-- Cada consulta traz a pergunta de negócio e as regras (RN) ou requisitos que atende.
-- =====================================================================
USE palazio_del_chef;

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
