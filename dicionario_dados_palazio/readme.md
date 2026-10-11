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

## FLUXO DE DADOS (DFD)

### 1. Modelo Conceitual 🏷️

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

### 2. Legenda e convenções do banco de dados

Esta seção apresenta as siglas, abreviações e convenções utilizadas na documentação do banco de dados do **Palazio del Chef**, facilitando a compreensão das entidades, dos atributos e de suas respectivas regras.


| Sigla           | Termo em inglês       | Significado em português | Descrição                                                                                                          |
| --------------- | --------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| **PK**          | Primary Key           | Chave primária           | Atributo que identifica exclusivamente cada registro de uma tabela. Não pode se repetir nem aceitar valores nulos. |
| **FK**          | Foreign Key           | Chave estrangeira        | Atributo que referencia uma chave de outra tabela, permitindo estabelecer relacionamentos entre entidades.         |
| **PK composta** | Composite Primary Key | Chave primária composta  | Chave primária formada por dois ou mais atributos, cuja combinação identifica exclusivamente um registro.          |

### Tipos de dados

| Termo              | Significado                                    | Descrição                                                                                                                   |
| ------------------ | ---------------------------------------------- | --------------------------------------------------------------------------------------------------------------------------- |
| **id_**           | Número identificador                           | Serve para identificar um número individualmente. 
| **qt_**           | Quantidade                                     | Serve para mostrar uma quantidade de alguma coisa ou de algum item. 
| **INT**           | Integer (inteiro)                              | Armazena números inteiros, sem casas decimais.                                                                              | 
| **VARCHAR**        | Variable Character (texto de tamanho variável) | Armazena textos com limite de caracteres definido.                                                                          |
| **DECIMAL**        | Número decimal                                 | Armazena valores numéricos com precisão definida, sendo adequado para valores monetários.                                   |
| **DATE**           | Data                                           | Armazena uma data, conforme o sistema gerenciador de banco de dados utilizado.                                              |
| **DATETIME**       | Data e hora                                    | Armazena uma data acompanhada de um horário, quando suportado pelo banco utilizado.                                         |
| **AUTO_INCREMENT** | Incremento automático                          | Recurso que gera automaticamente valores numéricos sequenciais para um atributo, conforme a configuração do banco de dados. |
| **NULL**           | Valor ausente ou desconhecido                  | Indica que não há um valor registrado para determinado atributo. Não é o mesmo que zero ou texto vazio.                     |
| **NOT NULL**       | Não nulo                                       | Restrição que impede que o atributo receba um valor nulo.                                                                   |
---

### 3. Convenções de nomenclatura

* Os nomes dos atributos devem utilizar letras minúsculas.
* Palavras compostas devem ser separadas por sublinhado (`_`), seguindo o padrão `snake_case`.
* Devem ser evitados espaços, acentos e caracteres especiais nos nomes dos atributos.
* As siglas **PK** e **FK** identificam, respectivamente, chaves primárias e estrangeiras na documentação.
* Os tipos de dados e as restrições devem ser definidos de acordo com o modelo do banco de dados e o sistema gerenciador escolhido.

**Observação:** esta legenda documenta as convenções adotadas no projeto. A utilização efetiva de tipos, restrições e recursos como `AUTO_INCREMENT` dependerá da implementação do banco de dados.


---

### 4. Expressão formal do modelo de dados

Esta seção apresenta a representação formal preliminar do modelo de dados do sistema Palazio del Chef, identificando as entidades, seus atributos, as chaves primárias (PK), as chaves estrangeiras (FK) e os relacionamentos entre as entidades.

### 4.1. Representação das entidades

- **ATENDENTE** (`id_atendente` PK, `nome_atendente`)
- **MESA** (`numero_mesa` PK)
- **PEDIDO** (`numero_pedido` PK, `data_pedido`, `forma_pagamento`, `id_atendente` FK, `numero_mesa` FK)
- **PRODUTO** (`codigo_produto` PK, `nome_produto`, `preco_atual`, `qt_estoque`, `id_setor` FK)
- **SETOR** (`id_setor` PK, `nome_setor`)

### 4.2. Representação dos relacionamentos

- **ATENDENTE — PEDIDO:** um atendente pode registrar vários pedidos, enquanto cada pedido é associado a um único atendente (1:N).
- **MESA — PEDIDO:** uma mesa pode estar associada a vários pedidos ao longo do tempo, enquanto cada pedido é associado a uma única mesa (1:N).
- **SETOR — PRODUTO:** um setor pode estar associado a vários produtos, enquanto cada produto é associado a um único setor (1:N).

### 4.3. Restrições gerais

- Cada entidade possui uma chave primária destinada a identificar unicamente seus registros.
- As chaves estrangeiras representam os vínculos entre as entidades relacionadas.
- Os relacionamentos devem respeitar as cardinalidades definidas no modelo conceitual.
- A obrigatoriedade e os valores permitidos para cada atributo são detalhados no dicionário de dados.

---

### 5. Estrutura técnica dos atributos

### Entidade: ATENDENTE

| Atributo             | Tipo         | Obrigatório      | Significado e relevância                                                                                                  |
| -------------------  | -------      | ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `id_atendente` (PK)  | INT          | Sim (`NOT NULL`) | Identificador único de cada atendente. É a chave primária (PK) e permite distinguir os atendentes cadastrados no sistema. |
| `nome_atendente`     | VARCHAR(100) | Sim (`NOT NULL`) | Armazena o nome do atendente. Permite identificar qual atendente está associado a um pedido.                              |

--- 

### Entidade: MESA

| Atributo           | Tipo | Obrigatório      | Significado e relevância                                                                                                                        |
| ------------------ | ---- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `numero_mesa`(PK)  | INT  | Sim (`NOT NULL`) | Número que identifica exclusivamente cada mesa do estabelecimento. É a chave primária (PK) e permite associar os pedidos à mesa correspondente. |

---

### Entidade: PEDIDO

| Atributo             | Tipo        | Obrigatório                           | Significado e relevância                                                                                                                            |
| -------------------- | ----------- | ------------------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------- |
| `numero_pedido`(PK)  | INT         | Sim (`NOT NULL`)                      | Identificador único de cada pedido. É a chave primária (PK) e permite distinguir os pedidos registrados no sistema.                                 |
| `data_pedido`        | DATETIME    | Sim (`NOT NULL`)                      | Registra a data e o horário em que o pedido foi realizado. Pode utilizar a data e a hora atuais como valor padrão.                                  |
| `forma_pagamento`    | VARCHAR(20)     | Não, enquanto o pedido estiver aberto (Null permitido)| Armazena a forma de pagamento utilizada como dinheiro, crédito, débito ou pix. Deve ser preenchido quando o pagamento for definido. |
| `id_atendente`(FK)  | INT          | Sim (`NOT NULL`)                      | Identifica o atendente responsável pelo pedido. É uma chave estrangeira (FK) relacionada ao atributo `id_atendente` da entidade ATENDENTE.          |
| `numero_mesa`(FK)    | INT         | Sim (`NOT NULL`)                      | Identifica a mesa associada ao pedido. É uma chave estrangeira (FK) relacionada ao atributo `numero_mesa` da entidade MESA.                         |

---

### Entidade: PRODUTO

| Atributo              | Tipo    | Obrigatório      | Significado e relevância                                                                                                   |
| --------------------- | ------- | ---------------- | -------------------------------------------------------------------------------------------------------------------------- |
| `codigo_produto`(PK)  | INT          | Sim (`NOT NULL`) | Identificador único de cada produto cadastrado. É a chave primária (PK) e permite distinguir um produto dos demais.        |
| `nome_produto`        | VARCHAR(100) | Sim (`NOT NULL`) | Armazena o nome do produto, permitindo identificá-lo nos pedidos e no cadastro do estabelecimento.                         |
| `preco_atual`         | DECIMAL(10,2)| Sim (`NOT NULL`) | Armazena o preço atual de venda do produto, utilizado como referência para calcular o valor dos pedidos.                   |
| `qt_estoque`          | INT          | Sim (`NOT NULL`) | Registra a quantidade disponível do produto em estoque. Pode iniciar com valor `0` quando não houver unidades disponíveis. |
| `id_setor`(FK)        | INT          | Sim (`NOT NULL`) | Identifica o setor responsável pelo produto, relacionando-o à entidade SETOR por meio de uma chave estrangeira (FK).       |

--- 

### Entidade: SETOR

| Atributo        | Tipo    | Obrigatório      | Significado e relevância                                                                                                                                                                              |
| --------------- | ------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id_setor`(PK)  | INT         | Sim (`NOT NULL`) | Identificador único de cada setor do estabelecimento. É a chave primária (PK) e permite distinguir os setores cadastrados no sistema.                                                                 |
| `nome_setor`    | VARCHAR(50) | Sim (`NOT NULL`) | Armazena o nome do setor responsável pelo preparo ou atendimento dos produtos. No projeto, os setores definidos são Bar e Cozinha. Permite identificar para qual setor cada produto está direcionado. |

---

## 6. Índices do Banco de Dados

Os índices são estruturas utilizadas para otimizar a localização e a recuperação de informações no banco de dados. Sua utilização contribui para melhorar o desempenho das consultas, principalmente em atributos frequentemente utilizados em pesquisas e relacionamentos entre entidades.

### 6.1. Índices definidos

| Índice | Entidade e atributo | Finalidade |
|---|---|---|
| `idx_pedido_numero_mesa` | PEDIDO (`numero_mesa`) | Otimizar as consultas de pedidos associados a uma mesa específica. |
| `idx_pedido_id_atendente` | PEDIDO (`id_atendente`) | Otimizar as consultas de pedidos registrados por um determinado atendente. |
| `idx_produto_nome` | PRODUTO (`nome_produto`) | Facilitar a localização de produtos por meio de seu nome. |
| `idx_produto_id_setor` | PRODUTO (`id_setor`) | Otimizar as consultas de produtos associados a um setor, como cozinha ou bar. |

### 6.2. Critérios de utilização

A definição dos índices considera as principais operações de consulta relacionadas ao funcionamento do Palazio del Chef, incluindo a localização de pedidos por mesa, a identificação dos pedidos registrados por atendentes, a pesquisa de produtos e a organização dos produtos por setor.

As chaves primárias também possuem função de identificação única dos registros e, nos sistemas gerenciadores de banco de dados mais utilizados, normalmente recebem índices automaticamente. A criação de índices adicionais deve considerar as necessidades de consulta e evitar estruturas redundantes.

A aplicação dos índices deve respeitar as características do sistema gerenciador de banco de dados utilizado e a estrutura física adotada na implementação.

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
