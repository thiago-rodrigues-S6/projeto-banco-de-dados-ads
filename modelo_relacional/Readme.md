# Sistema de Gerenciamento de Pedidos — Palazio del Chef

## Sobre o projeto

Projeto de modelagem de banco de dados para um sistema de gerenciamento de pedidos de um restaurante. O objetivo é organizar e relacionar as informações referentes aos pedidos, funcionários, mesas, produtos, pagamentos, notas fiscais, insumos, compras e fornecedores.

O banco de dados foi desenvolvido a partir de um **Modelo Entidade-Relacionamento (DER)** e posteriormente convertido em um **Modelo Lógico Relacional**, definindo as tabelas, seus atributos, chaves primárias (PK), chaves estrangeiras (FK) e respectivos relacionamentos.

## Modelo do Banco de Dados

O modelo lógico é composto pelas seguintes tabelas:

- **Atendente:** armazena a identificação e o nome dos funcionários responsáveis pelo atendimento e registro dos pedidos.
- **Mesa:** identifica as mesas disponíveis no estabelecimento.
- **Pedido:** registra os pedidos realizados, relacionando mesas e atendentes. Também armazena a data, o horário e a confirmação de maioridade do consumidor.
- **Nota Fiscal:** armazena as informações referentes à NFC-e (Nota Fiscal de Consumidor Eletrônica), incluindo chave de acesso, número, série, data de emissão, valor total e CPF do consumidor.
- **Pagamento:** registra os pagamentos realizados, incluindo valor pago, data, horário e referências ao pedido, à nota fiscal e à modalidade de pagamento.
- **Formas de Pagamento:** identifica as modalidades de pagamento disponíveis por meio de uma descrição, permitindo cadastrar diferentes formas de pagamento.
- **Produto:** contém os produtos cadastrados no restaurante, incluindo nome, preço atual, limite diário de vendas, identificação de bebidas alcoólicas e referências ao setor e ao insumo.
- **Setor:** identifica os setores responsáveis pelos produtos do estabelecimento.
- **Item Pedido:** registra os produtos pertencentes a cada pedido, suas respectivas quantidades, preços unitários, status e informações sobre possíveis cancelamentos.
- **Insumo:** armazena os dados dos insumos utilizados pelo restaurante, incluindo nome, unidade de medida, quantidade disponível e quantidade mínima.
- **Compra:** registra as aquisições de insumos, incluindo quantidade, desconto, valor unitário e referências ao insumo e à nota fiscal de compra.
- **Nota Fiscal Compra:** armazena os dados fiscais das compras realizadas, incluindo número, série, chave de acesso, datas de emissão e entrada, valor total e identificação do fornecedor.
- **Fornecedor:** mantém os dados cadastrais dos fornecedores, incluindo razão social, CNPJ, telefone e endereço.

## Principais relacionamentos

### Atendente → Pedido
Um atendente pode estar associado a vários pedidos, enquanto cada pedido está relacionado a um único atendente.

### Mesa → Pedido
Uma mesa pode estar relacionada a vários pedidos ao longo do tempo, enquanto cada pedido está associado a uma única mesa.

### Pedido → Nota Fiscal
Um pedido pode estar associado a nenhuma ou várias notas fiscais, enquanto cada nota fiscal está vinculada a um único pedido.

### Pedido → Pagamento
Um pedido pode possuir vários registros de pagamento, enquanto cada pagamento está associado a um único pedido.

### Nota Fiscal → Pagamento
Uma nota fiscal pode estar relacionada a vários pagamentos, enquanto cada pagamento referencia uma única nota fiscal.

### Formas de Pagamento → Pagamento
Uma modalidade de pagamento pode ser utilizada em vários pagamentos, enquanto cada registro de pagamento está associado a uma única modalidade.

### Pedido → Item Pedido
Um pedido pode conter vários itens, enquanto cada registro de item pertence a um único pedido.

### Produto → Item Pedido
Um produto pode aparecer em vários itens de pedidos diferentes, enquanto cada item está associado a um único produto.

### Produto → Setor
Um setor pode possuir vários produtos, enquanto cada produto está associado a um único setor.

### Produto → Insumo
Um insumo pode estar relacionado a vários produtos, enquanto cada produto possui referência a um único insumo no modelo atual.

### Insumo → Compra
Um insumo pode estar presente em vários registros de compra, enquanto cada compra está associada a um único insumo.

### Compra → Nota Fiscal Compra
Uma nota fiscal de compra pode estar relacionada a vários registros de compra, enquanto cada registro de compra referencia uma única nota fiscal de compra.

### Fornecedor → Nota Fiscal Compra
Um fornecedor pode estar relacionado a várias notas fiscais de compra, enquanto cada nota fiscal de compra está associada a um único fornecedor.

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
- `data_hora_pedido`
- `maioridade_confirmada`

### Nota Fiscal
- `id_nota_fiscal` (PK)
- `num_pedido` (FK)
- `chave_acesso`
- `data_emissao`
- `valor_total`
- `serie`
- `numero_nota`
- `cpf_consumidor`

### Pagamento
- `id_pagamento` (PK)
- `id_nota_fiscal` (FK)
- `id_formas_pagamento` (FK)
- `num_pedido` (FK)
- `valor_pago`
- `data_hora_pagamento`

### Formas de Pagamento
- `id_forma_pagamento` (PK)
- `descricao`

### Produto
- `codigo_produto` (PK)
- `idsetor` (FK)
- `idinsumo` (FK)
- `nome_produto`
- `bebida_alcoolica`
- `preco_atual`
- `limite_diario`

### Setor
- `id_setor` (PK)
- `nome_setor`

### Item Pedido
- `codigo_produto` (PK, FK)
- `num_pedido` (PK, FK)
- `qt_produto`
- `preco_unitario`
- `status`
- `motivo_cancelamento`
- `data_hora_cancelamento`

### Insumo
- `id_insumo` (PK)
- `qt_insumo`
- `qt_minima_insumo`
- `nome_insumo`
- `unidade_insumo`

### Compra
- `id_compra` (PK)
- `id_nota_fiscal_compra` (FK)
- `id_insumo` (FK)
- `desconto`
- `valor_unitario`
- `quantidade`

### Nota Fiscal Compra
- `id_nota_compra` (PK)
- `id_fornecedor` (FK)
- `numero_nota`
- `serie`
- `chave_acesso`
- `data_emissao`
- `data_entrada`
- `valor_total`

### Fornecedor
- `id_fornecedor` (PK)
- `razao_social`
- `telefone`
- `cnpj`
- `endereco`

## Regras de negócio

O modelo contempla algumas regras importantes para o funcionamento do restaurante:

- **Limite diário de vendas:** cada produto possui o atributo `limite_diario`, permitindo controlar a quantidade máxima de vendas por dia.
- **Controle de bebidas alcoólicas:** o atributo `bebida_alcoolica` identifica os produtos que exigem confirmação de maioridade.
- **Confirmação de maioridade:** o atributo `maioridade_confirmada` registra a confirmação referente ao atendimento de pedidos que envolvem bebidas alcoólicas.
- **Controle de pedidos:** cada pedido é associado a uma mesa e a um atendente responsável.
- **Controle de itens:** cada item de pedido armazena a quantidade, o preço unitário e o status correspondente.
- **Controle de cancelamentos:** a tabela Item Pedido armazena o status, o motivo do cancelamento e a data e horário correspondentes.
- **Controle de insumos:** o sistema mantém as quantidades disponíveis e mínimas dos insumos, auxiliando no acompanhamento do estoque.
- **Registro de compras:** as aquisições de insumos são relacionadas às respectivas notas fiscais de compra e aos fornecedores.
- **Registro fiscal:** o sistema contempla notas fiscais de venda e de compra, armazenando seus dados de identificação e controle.
- **Controle de pagamentos:** os pagamentos são associados aos pedidos, às notas fiscais e às respectivas modalidades utilizadas.

## Tipos de dados e limitações da ferramenta

Durante a construção do modelo lógico, foram utilizados os tipos de dados disponíveis na plataforma **brModelo Web**.

Alguns tipos utilizados como referência na modelagem de bancos de dados relacionais não estavam disponíveis na ferramenta. Por esse motivo, foram realizadas adaptações para manter a estrutura do modelo compatível com o ambiente de desenvolvimento.

As principais adaptações foram:

- **DECIMAL(10,2) → FLOAT:** utilizado para representar valores monetários, como preços, descontos, pagamentos e valores totais.
- **TINYINT → BOOLEAN:** utilizado para atributos de natureza lógica, como `bebida_alcoolica` e `maioridade_confirmada`.

Essas substituições foram realizadas devido às limitações de tipos de dados da plataforma utilizada, não representando necessariamente a escolha definitiva para uma futura implementação física do banco de dados.

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
- Regras de Negócio

## Objetivo

Este projeto foi desenvolvido com o objetivo de aplicar e consolidar conhecimentos relacionados à modelagem e organização de bancos de dados relacionais, utilizando um cenário prático de gerenciamento de pedidos de um restaurante.

Entre os principais conceitos trabalhados estão:

- Identificação e organização de entidades e atributos.
- Transformação do modelo conceitual em modelo lógico.
- Definição de chaves primárias e estrangeiras.
- Construção de relacionamentos e tabelas associativas.
- Aplicação de chaves primárias compostas.
- Definição e adaptação de tipos de dados.
- Representação de regras de negócio por meio da estrutura do banco de dados.

[🔝 Voltar ao início](https://github.com/thiago-rodrigues-S6/projeto-banco-de-dados-ads)
