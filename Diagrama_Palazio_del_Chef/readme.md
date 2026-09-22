# Sistema de Gerenciamento de Pedidos

Projeto desenvolvido para representar o banco de dados de um sistema de gerenciamento de pedidos.

## Sobre o projeto

O sistema tem como objetivo organizar informações relacionadas aos pedidos realizados no estabelecimento, permitindo relacionar funcionários, mesas, produtos, setores e itens dos pedidos.

O banco de dados foi desenvolvido a partir de um modelo entidade-relacionamento (DER).

## Modelo do Banco de Dados

O sistema possui as seguintes entidades:

- **Funcionário**: armazena os dados dos funcionários.
- **Mesa**: representa as mesas disponíveis no estabelecimento.
- **Produto**: contém as informações dos produtos cadastrados.
- **Setor**: identifica o setor ao qual um produto pertence.
- **Pedido**: armazena as informações dos pedidos realizados.
- **Item Pedido**: representa os produtos incluídos em cada pedido.

## Principais relacionamentos

### Funcionário → Pedido
Um funcionário pode registrar vários pedidos, enquanto cada pedido é registrado por um funcionário.

### Mesa → Pedido
Uma mesa pode estar relacionada a vários pedidos, enquanto cada pedido está associado a uma mesa.

### Pedido → Item Pedido
Um pedido pode possuir vários itens, e cada item pertence a um pedido.

### Produto → Item Pedido
Um produto pode aparecer em vários itens de pedidos.

### Produto → Setor
Cada produto é designado a um setor, e um setor pode possuir vários produtos.

## Principais atributos

### Funcionário
- `id_funcionario`
- `funcao`
- `funcao_funcionario`

### Mesa
- `Num_mesa`

### Produto
- `cd_barra`
- `Nome_produto`
- `valor_produto`
- `qt_produto`

### Setor
- `id_setor`
- `nome_setor`

### Pedido
- `Num_pedido`
- `data_pedido`
- `forma_pagamento`
- `Num_mesa`

### Item Pedido
- `Num_pedido`
- `cd_produto`
- `qt_produto`
- `valor_unitario`

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
