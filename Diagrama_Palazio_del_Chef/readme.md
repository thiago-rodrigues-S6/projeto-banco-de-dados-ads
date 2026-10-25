# Sistema de Gerenciamento de Pedidos — Palazio del Chef

## Sobre o projeto

Projeto de modelagem de banco de dados para um sistema de gerenciamento de pedidos de um restaurante. O objetivo é organizar as informações relacionadas aos pedidos, funcionários, mesas, produtos, pagamentos, notas fiscais, estoque e fornecedores.

O banco de dados foi desenvolvido a partir de um **Modelo-Entidade-Relacionamento (DER)**, representando as entidades, seus atributos, os relacionamentos e as respectivas cardinalidades.

## Modelo do Banco de Dados

O sistema possui as seguintes entidades:

- **Atendente:** armazena os dados dos funcionários responsáveis pelo registro dos pedidos.
- **Mesa:** representa as mesas disponíveis no estabelecimento.
- **Pedido:** registra os pedidos realizados, incluindo data, horário, status e informações sobre cancelamentos.
- **Produto:** contém os produtos cadastrados, preços, limite diário de vendas e identificação de bebidas alcoólicas.
- **Setor:** identifica o setor ao qual cada produto pertence.
- **Estoque:** controla a quantidade disponível dos produtos armazenados.
- **Fornecedor:** armazena informações sobre os fornecedores do restaurante.
- **Pagamento:** registra os pagamentos realizados, incluindo valor, data, horário e forma de pagamento.
- **Nota Fiscal:** armazena os dados relacionados à NFC-e (Nota Fiscal de Consumidor Eletrônica).

## Principais relacionamentos

### Funcionário → Pedido
Um Funcionário pode registrar vários pedidos, enquanto cada pedido é registrado por um único funcionário.

### Mesa → Pedido
Uma mesa pode estar relacionada a vários pedidos ao longo do tempo, enquanto cada pedido está associado a uma mesa.

### Pedido → Produto
Um pedido pode conter vários produtos, e um produto pode aparecer em diferentes pedidos. O relacionamento registra a quantidade de cada produto e seu preço unitário.

### Produto → Setor
Cada produto é designado a um setor, e um setor pode possuir vários produtos.

### Produto → Estoque
O relacionamento controla as informações referentes ao estoque dos produtos, incluindo as quantidades disponíveis.

### Fornecedor → Estoque
Representa o fornecimento de produtos ao estoque do restaurante, permitindo relacionar fornecedores e registros de estoque.

### Pedido → Pagamento
Um pedido pode receber vários pagamentos, enquanto cada pagamento está associado a um único pedido.

### Pedido → Nota Fiscal
A nota fiscal refere-se ao pedido correspondente. O modelo prevê uma NFC-e para a venda, independentemente da quantidade de formas de pagamento utilizadas.

## Principais atributos

### Atendente
- `id_atendente`
- `nome_atendente`

### Mesa
- `nmr_mesa`

### Pedido
- `Num_pedido`
- `data_hora_pedido`
- `status`
- `motivo_cancelamento`
- `data_hora_cancelamento`
- `maior_idade`

### Produto
- `codigo_produto`
- `nome_produto`
- `preço_atual`
- `limite_diario`
- `bebida_alcoolica`

### Setor
- `id_setor`
- `nome_setor`

### Estoque
- `id_estoque`
- `qt_produto_estoque`
- `qt_disponível`

### Fornecedor
- `id_fornecedor`
- `razão_social`
- `CNPJ`
- `telefone`
- `endereço`
- `prazo_entrega`
- `prazo_custo`

### Pagamento
- `id_pagamento`
- `data_hora_pagamento`
- `valor_pago`
- `id_formas_pagamento`

### Nota Fiscal
- `id_nota_fiscal`
- `numero_nota`
- `serie`
- `data_emissão`
- `valor_total`
- `chave_acesso`
- `CPF_consumidor`

## Tecnologias

- Modelagem de Banco de Dados
- Modelo Entidade-Relacionamento (DER)
- SQL
- Banco de Dados Relacional

## Objetivo

Este projeto foi desenvolvido com o objetivo de praticar conceitos de:

- Modelagem de dados
- Entidades e atributos
- Chaves primárias
- Chaves estrangeiras
- Relacionamentos
- Cardinalidade
- Organização de bancos de dados relacionais

## Status

🚧 Projeto em desenvolvimento.

[🔝 Voltar ao início](https://github.com/thiago-rodrigues-S6/projeto-banco-de-dados-ads)
