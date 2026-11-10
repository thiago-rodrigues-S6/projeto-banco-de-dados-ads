-- =====================================================================
-- Palazio del Chef | UPDATE e DELETE (MySQL 8.0)
-- Banco: palazio_del_chef (banco-de-dados-palazio2.sql)
-- Cada comando traz a situação de negócio, a conferência ANTES e a
-- conferência DEPOIS. Tudo roda dentro de uma transação que termina em
-- ROLLBACK: o banco volta ao estado original e as consultas e os slides
-- continuam valendo. Para gravar de verdade, troque o ROLLBACK final por COMMIT.
-- =====================================================================
USE palazio_del_chef;

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
