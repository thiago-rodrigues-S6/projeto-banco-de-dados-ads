# Sistema de Gerenciamento de Pedidos — Palazio del Chef

## Sobre o projeto

Projeto de modelagem de banco de dados para um sistema de gerenciamento de pedidos de um restaurante. O objetivo é organizar e relacionar as informações referentes aos pedidos, funcionários, mesas, produtos, pagamentos, notas fiscais, insumos, compras e fornecedores.

O banco de dados foi desenvolvido a partir de um **Modelo Entidade-Relacionamento (DER)** e posteriormente convertido em um **Modelo Lógico**, definindo as tabelas, seus atributos, chaves primárias (PK), chaves estrangeiras (FK) e relacionamentos.

## Modelo do Banco de Dados

O modelo lógico é composto pelas seguintes tabelas:

- **Atendente:** armazena a identificação e o nome dos funcionários responsáveis pelo atendimento e registro dos pedidos.
- **Mesa:** identifica as mesas disponíveis no estabelecimento.
- **Pedido:** registra os pedidos realizados, relacionando mesas, atendentes e notas fiscais. Também armazena a data, o horário e a confirmação de maioridade do consumidor.
- **Produto:** contém os produtos cadastrados no restaurante, incluindo nome, limite diário de vendas e identificação de bebidas alcoólicas.
- **Setor:** identifica os setores responsáveis pelos produtos do estabelecimento.
- **Designado:** relaciona os produtos aos seus respectivos setores.
- **Possui (Item Pedido):** registra os produtos pertencentes a cada pedido, suas quantidades, preços unitários e informações sobre o status e possíveis cancelamentos.
- **Pagamento:** armazena os pagamentos realizados, incluindo valor pago, data e horário, além da identificação da nota fiscal correspondente.
- **Formas de Pagamento:** registra as modalidades de pagamento disponíveis, contemplando PIX, crédito, débito e dinheiro.
- **Nota Fiscal:** armazena as informações referentes à NFC-e (Nota Fiscal de Consumidor Eletrônica), incluindo chave de acesso, número, série, data de emissão e valor total.
- **Insumo:** mantém os dados dos insumos utilizados pelo restaurante, incluindo nome, unidade de medida, quantidade disponível e quantidade mínima.
- **Referente:** estabelece o relacionamento entre produtos e insumos utilizados em sua composição.
- **Compra:** registra as informações das compras de insumos, incluindo quantidade, desconto, valor unitário e referências ao insumo e à nota fiscal de compra.
- **Nota Fiscal Compra:** armazena os dados fiscais das compras realizadas, incluindo datas de entrada e emissão, chave de acesso, número, série, valor total e identificação do fornecedor.
- **Fornecedor:** mantém os dados cadastrais dos fornecedores, incluindo razão social, CNPJ, telefone e endereço.

## Principais relacionamentos

### Atendente → Pedido
Um atendente pode registrar vários pedidos, enquanto cada pedido está associado a um único atendente.

### Mesa → Pedido
Uma mesa pode estar relacionada a vários pedidos ao longo do tempo, enquanto cada pedido está associado a uma única mesa.

### Pedido → Produto
O relacionamento é representado pela tabela associativa **Possui**, permitindo que um pedido contenha vários produtos e que um produto esteja presente em diferentes pedidos. A tabela registra a quantidade, o preço unitário, o status e as informações de cancelamento de cada item.

### Produto → Setor
O relacionamento é realizado pela tabela **Designado**, associando os produtos aos setores responsáveis. Um setor pode possuir vários produtos, enquanto cada produto está associado a um setor.

### Produto → Insumo
O relacionamento é representado pela tabela **Referente**, permitindo associar os produtos aos insumos utilizados em sua composição.

### Pedido → Nota Fiscal
O pedido possui referência à nota fiscal correspondente, permitindo relacionar as informações da venda à respectiva NFC-e.

### Nota Fiscal → Pagamento
A tabela Pagamento possui uma chave estrangeira que referencia a Nota Fiscal, permitindo registrar os pagamentos associados ao documento fiscal.

### Pagamento → Formas de Pagamento
A tabela Formas de Pagamento está relacionada aos registros de pagamento e identifica as modalidades utilizadas: PIX, crédito, débito e dinheiro.

### Insumo → Compra
A tabela Compra referencia os insumos adquiridos, registrando informações como quantidade, desconto e valor unitário.

### Compra → Nota Fiscal Compra
Cada registro de compra possui referência à nota fiscal de compra correspondente, permitindo organizar os dados das aquisições realizadas.

### Fornecedor → Nota Fiscal Compra
Um fornecedor pode estar relacionado a várias notas fiscais de compra, enquanto cada nota fiscal de compra está associada a um fornecedor.

## Principais atributos

### Atendente
- `id_atendente` (PK)
- `nome_atendente`

### Mesa
- `nmr_mesa` (PK)

### Pedido
- `num_pedido` (PK)
- `id_mesa` (FK)
- `id_atendente` (FK)
- `id_nota_fiscal` (FK)
- `data_hora_pedido`
- `maioridade_confirmada`

### Produto
- `codigo_produto` (PK)
- `nome_produto`
- `limite_diario`
- `bebida_alcoolica`

### Setor
- `id_setor` (PK)
- `nome_setor`

### Designado
- `codigo_produto` (PK, FK)
- `id_setor` (PK, FK)

### Possui (Item Pedido)
- `codigo_produto` (PK, FK)
- `num_pedido` (PK, FK)
- `qt_produto`
- `preco_unitario`
- `status`
- `motivo_cancelamento`
- `data_hora_cancelamento`

### Pagamento
- `id_pagamento` (PK)
- `id_nota_fiscal` (FK)
- `valor_pago`
- `data_hora_pagamento`

### Formas de Pagamento
- `id_forma_pagamento` (PK)
- `id_pagamento` (FK)
- `pix`
- `credito`
- `debito`
- `dinheiro`

### Nota Fiscal
- `id_nota_fiscal` (PK)
- `chave_acesso`
- `data_emissao`
- `valor_total`
- `serie`
- `numero_nota`
- `cpf_consumidor`

### Insumo
- `id_insumo` (PK)
- `qt_insumo`
- `qt_minima_insumo`
- `nome_insumo`
- `unidade_insumo`

### Referente
- `id_insumo` (PK, FK)
- `codigo_produto` (PK, FK)

### Compra
- `id_compra` (PK)
- `desconto`
- `valor_unitario`
- `quantidade`
- `id_insumo` (FK)
- `idnota_fiscal_compra` (FK)

### Nota Fiscal Compra
- `id_nota_compra` (PK)
- `data_entrada`
- `data_emissao`
- `chave_acesso`
- `serie`
- `numero_nota`
- `valor_total`
- `id_fornecedor` (FK)

### Fornecedor
- `id_fornecedor` (PK)
- `razao_social`
- `telefone`
- `cnpj`
- `endereco`

## Regras de negócio

O modelo contempla algumas regras importantes para o funcionamento do restaurante:

- **Limite diário de vendas:** cada produto possui um atributo `limite_diario`, permitindo controlar a quantidade máxima de vendas por dia.
- **Controle de bebidas alcoólicas:** o atributo `bebida_alcoolica` identifica os produtos que exigem confirmação de maioridade.
- **Confirmação de maioridade:** o atributo `maioridade_confirmada` registra a confirmação realizada antes da inclusão de bebidas alcoólicas no pedido.
- **Controle de cancelamentos:** a tabela Possui armazena o status dos itens, o motivo do cancelamento e a data e horário correspondentes.
- **Controle de insumos:** o sistema mantém as quantidades disponíveis e mínimas dos insumos, auxiliando no acompanhamento do estoque.
- **Registro fiscal:** as notas fiscais de venda e de compra possuem informações próprias para identificação e controle das operações.
- **Controle de pagamentos:** o sistema contempla diferentes modalidades de pagamento e permite registrar os valores associados às notas fiscais.

## Tecnologias e conceitos utilizados

- Modelagem de Banco de Dados
- Modelo Entidade-Relacionamento (DER)
- Modelo Lógico Relacional
- brModelo Web
- SQL
- Banco de Dados Relacional
- Chaves Primárias (PK)
- Chaves Estrangeiras (FK)
- Chaves Compostas
- Relacionamentos e Cardinalidade
- Tipos de Dados

## Objetivo

Este projeto foi desenvolvido com o objetivo de aplicar e consolidar conhecimentos relacionados à modelagem e organização de bancos de dados relacionais, utilizando um cenário prático de gerenciamento de pedidos de um restaurante.

Entre os principais conceitos trabalhados estão:

- Identificação e organização de entidades e atributos.
- Transformação do modelo conceitual em modelo lógico.
- Definição de chaves primárias e estrangeiras.
- Construção de relacionamentos e tabelas associativas.
- Aplicação de chaves primárias compostas.
- Definição de tipos de dados.
- Representação de regras de negócio por meio da estrutura do banco de dados.

O resultado é um modelo lógico estruturado para representar as principais operações do restaurante Palazio del Chef.
