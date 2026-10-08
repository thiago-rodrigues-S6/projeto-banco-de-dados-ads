# 📚 Dicionário de Dados Conceitual — Palazio del Chef

## 📌 Sobre o projeto

Este repositório contém o **Dicionário de Dados Conceitual (Preliminar)** do projeto Palazio del Chef, desenvolvido como parte da disciplina de Banco de Dados do curso de Análise e Desenvolvimento de Sistemas.

O documento tem como objetivo organizar e descrever os atributos das entidades identificadas no contexto do estabelecimento, facilitando a compreensão das informações que compõem o modelo de dados.

O dicionário foi estruturado conforme o modelo solicitado na disciplina, utilizando três campos principais: **Atributo, Descrição e Regra de negócio associada**.

---

## 🎯 Objetivo do dicionário

O Dicionário de Dados Conceitual tem a finalidade de documentar os atributos que compõem cada entidade do projeto, explicando o significado de cada informação e as regras que orientam sua utilização.

Essa documentação contribui para:

- Padronizar a descrição dos dados do projeto.
- Facilitar a compreensão das entidades e de seus atributos.
- Registrar regras de negócio relacionadas aos dados.
- Reduzir ambiguidades na interpretação das informações.
- Apoiar as próximas etapas da modelagem do banco de dados.

---

## 🗂️ Organização do documento

O dicionário está organizado por entidades. Cada entidade possui uma tabela com três colunas, seguindo o padrão definido para a atividade acadêmica.

### 1. Atributo

Identifica o nome do atributo pertencente à entidade.

Cada atributo representa uma informação relevante para o funcionamento do sistema. Sua nomenclatura deve ser clara e padronizada, facilitando a identificação e a compreensão dos dados.

### 2. Descrição

Apresenta o significado do atributo e explica qual informação ele representa dentro do contexto do Palazio del Chef.

O objetivo é permitir que qualquer pessoa que consulte o dicionário compreenda a finalidade do atributo sem depender de interpretações ou conhecimentos prévios sobre sua utilização.

### 3. Regra de negócio associada

Registra as condições e restrições que devem ser respeitadas na utilização do atributo, quando aplicáveis.

Essas regras podem estabelecer, por exemplo:

- Obrigatoriedade de preenchimento.
- Unicidade de identificadores.
- Valores ou categorias permitidos.
- Restrições relacionadas ao funcionamento do estabelecimento.
- Condições que devem ser respeitadas para manter a consistência dos dados.

As regras documentadas devem ser coerentes com as necessidades e os processos definidos para o projeto.

---

## 🏷️ Entidades documentadas

O documento contempla as seguintes entidades:

| Entidade | Relaciona-se com | Cardinalidade |
|---|---|---|
| **Atendente** | Pedido | 1:N — Um atendente pode registrar vários pedidos, mas cada pedido é associado a um único atendente (**N:1 na visão de Pedido).**
| **Mesa** | Pedido | 1:N — Uma mesa pode estar associada a vários pedidos ao longo do tempo, mas cada pedido é associado a uma única nesa(**N:1 na visão de Pedido).**
| **Pedido** | Atendente e Mesa |  N:1 — Cada pedido está associado a um único atendente e a uma única mesa. Um atendente e uma mesa podem estar associados a vários pedidos. 
| **Produto** | Setor | N:1 — Vários produtos podem pertencer ao mesmo setor, mas cada produto está associado a um único setor: (**1:N na visão de Setor).**
| **Setor** | Produto | 1:N — Um setor pode ser responsável por vários produtos, enquanto cada produto pertence a um único setor (**N:1 na visão de Produto).**

Cada entidade possui seus atributos documentados individualmente, acompanhados de suas respectivas descrições e regras de negócio.

---

## Legenda e convenções do banco de dados

Esta seção apresenta as siglas, abreviações e convenções utilizadas na documentação do banco de dados do **Palazio del Chef**, facilitando a compreensão das entidades, dos atributos e de suas respectivas regras.

### 1. Chaves e relacionamentos

| Sigla           | Termo em inglês       | Significado em português | Descrição                                                                                                          |
| --------------- | --------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| **PK**          | Primary Key           | Chave primária           | Atributo que identifica exclusivamente cada registro de uma tabela. Não pode se repetir nem aceitar valores nulos. |
| **FK**          | Foreign Key           | Chave estrangeira        | Atributo que referencia uma chave de outra tabela, permitindo estabelecer relacionamentos entre entidades.         |
| **PK composta** | Composite Primary Key | Chave primária composta  | Chave primária formada por dois ou mais atributos, cuja combinação identifica exclusivamente um registro.          |

### 2. Tipos de dados

| Termo              | Significado                                    | Descrição                                                                                                                   |
| ------------------ | ---------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **INT**            | Integer (inteiro)                              | Armazena números inteiros, sem casas decimais.                                                                              |
| **VARCHAR**        | Variable Character (texto de tamanho variável) | Armazena textos com limite de caracteres definido.                                                                          |
| **DECIMAL**        | Número decimal                                 | Armazena valores numéricos com precisão definida, sendo adequado para valores monetários.                                   |
| **DATE**           | Data                                           | Armazena uma data, conforme o sistema gerenciador de banco de dados utilizado.                                              |
| **DATETIME**       | Data e hora                                    | Armazena uma data acompanhada de um horário, quando suportado pelo banco utilizado.                                         |
| **AUTO_INCREMENT** | Incremento automático                          | Recurso que gera automaticamente valores numéricos sequenciais para um atributo, conforme a configuração do banco de dados. |
| **NULL**           | Valor ausente ou desconhecido                  | Indica que não há um valor registrado para determinado atributo. Não é o mesmo que zero ou texto vazio.                     |
| **NOT NULL**       | Não nulo                                       | Restrição que impede que o atributo receba um valor nulo.                                                                   |

### 3. Convenções de nomenclatura

* Os nomes dos atributos devem utilizar letras minúsculas.
* Palavras compostas devem ser separadas por sublinhado (`_`), seguindo o padrão `snake_case`.
* Devem ser evitados espaços, acentos e caracteres especiais nos nomes dos atributos.
* As siglas **PK** e **FK** identificam, respectivamente, chaves primárias e estrangeiras na documentação.
* Os tipos de dados e as restrições devem ser definidos de acordo com o modelo do banco de dados e o sistema gerenciador escolhido.

**Observação:** esta legenda documenta as convenções adotadas no projeto. A utilização efetiva de tipos, restrições e recursos como `AUTO_INCREMENT` dependerá da implementação do banco de dados.


---

## 📄 Arquivo disponível

O dicionário está disponível em formato HTML, permitindo a visualização das tabelas e a consulta das informações por entidade.

**Arquivo principal:** `dicionario_dados_palazio.html`

O documento apresenta as informações de maneira organizada, facilitando a leitura e a consulta dos atributos e das regras de negócio associadas.

---

## 📐 Padronização e organização

Para manter a consistência da documentação, o dicionário utiliza o mesmo formato de tabela para todas as entidades.

A padronização busca garantir:

- Uniformidade na apresentação das informações.
- Clareza na nomenclatura dos atributos.
- Descrições objetivas e contextualizadas.
- Regras de negócio compatíveis com o funcionamento proposto para o estabelecimento.

Essa organização facilita futuras revisões e contribui para a evolução da modelagem de dados.

---

## 🔒 Privacidade e responsabilidade

A documentação prioriza a descrição conceitual dos dados necessários ao funcionamento do sistema.

Eventuais exemplos utilizados para ilustrar os atributos devem ser fictícios e coerentes com as operações do estabelecimento, sem expor informações pessoais reais de clientes, atendentes ou outras pessoas.

---

## 🚀 Considerações finais

O Dicionário de Dados Conceitual do Palazio del Chef constitui uma documentação de apoio à modelagem do banco de dados, reunindo o significado dos atributos e as regras de negócio relacionadas às entidades identificadas.

Sua estrutura busca tornar as informações compreensíveis, organizadas e padronizadas, contribuindo para a comunicação entre os integrantes do grupo e para o desenvolvimento das próximas etapas do projeto.

---

**Projeto:** Palazio del Chef  
**Documento:** Dicionário de Dados Conceitual (Preliminar)  
**Formato:** HTML  
**Curso:** Análise e Desenvolvimento de Sistemas
