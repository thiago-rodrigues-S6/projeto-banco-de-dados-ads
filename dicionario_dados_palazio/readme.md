# Dicionário de Dados — Palazio del Chef

Esta pasta contém a documentação do Dicionário de Dados desenvolvido para o banco de dados do projeto **Palazio del Chef**.

O Dicionário de Dados tem como objetivo descrever os atributos utilizados no banco de dados, apresentando suas características, finalidades, tipos de dados, valores permitidos e demais informações relevantes para a compreensão e implementação do modelo.

## 📁 Arquivos

### 📊 Dicionario_de_Dados.xlsx

Arquivo em formato Excel contendo o Dicionário de Dados em sua versão editável.

O arquivo está organizado por entidades, permitindo a consulta individual das informações de cada uma delas.

### 📄 Dicionario_de_Dados_Completo.pdf

Versão em PDF do Dicionário de Dados, destinada principalmente à consulta e visualização da documentação.

O PDF reúne todas as entidades em um único arquivo, facilitando a leitura sem a necessidade de utilizar um editor de planilhas.

### 📄 Dicionario_de_Dados.HTML

Um Dicionário de Dados interativo em formato web. 

Ele documenta todas as regras de negócio aplicadas ao banco de dados em formato HTML para melhor compreensão e facilidade para visualizar pelo navegador

## 🗂️ Entidades documentadas

O Dicionário de Dados contempla as seguintes entidades:

- **Atendente** — informações relacionadas aos atendentes responsáveis pelo registro dos pedidos.
- **Mesa** — identificação das mesas utilizadas no estabelecimento.
- **Pedido** — informações referentes aos pedidos realizados.
- **Item_pedido** — itens que compõem cada pedido, incluindo quantidade e valor unitário.
- **Produto** — informações dos produtos comercializados pelo estabelecimento.
- **Setor** — setores responsáveis pela preparação ou atendimento dos produtos.

## 📋 Estrutura do Dicionário

Cada entidade apresenta seus atributos organizados nas seguintes informações:

| Campo | Descrição |
|---|---|
| **Variável** | Atributo representado no banco de dados. |
| **Nome da Variável** | Nome utilizado para representar o atributo no sistema. |
| **Tipo de Variável** | Tipo de dado utilizado pelo atributo. |
| **Descrição** | Explicação sobre a finalidade e o significado do atributo. |
| **Valores Permitidos** | Valores ou categorias que podem ser armazenados. |
| **Possui Valores Nulos?** | Indica se o atributo pode permanecer sem valor. |
| **Anotações** | Informações complementares sobre o atributo, como chaves primárias, chaves estrangeiras e outras regras. |

## 🔗 Relação com o modelo de dados

O Dicionário de Dados complementa o **Modelo Entidade-Relacionamento (DER)** e o modelo conceitual do projeto, detalhando os atributos que compõem cada entidade e suas respectivas características.

A documentação foi desenvolvida de acordo com as regras e necessidades identificadas para o sistema do restaurante/bar **Palazio del Chef**.

[🔝 Voltar ao início](https://github.com/thiago-rodrigues-S6/projeto-banco-de-dados-ads)
