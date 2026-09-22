# 🍽️ Projeto: Palazio del Chef

<p align="center">
  <img src="https://img.shields.io/badge/Status-Em%20Andamento-yellow?style=for-the-badge" alt="Status">
  <img src="https://img.shields.io/badge/Banco_de_Dados-Relacional-blue?style=for-the-badge&logo=mysql" alt="Banco de Dados">
</p>

---

## 📖 1. Contextualização e Visão Geral

### 📍 O Estabelecimento

O **Palazio del Chef** é um estabelecimento do segmento de alimentação, com características de restaurante e bar. Possui médio porte e apresenta um fluxo considerável de clientes.

A escolha do estabelecimento para o desenvolvimento do projeto ocorreu devido à sua estrutura operacional e aos processos envolvidos em seu funcionamento, possibilitando a aplicação dos conceitos de modelagem de banco de dados.

### 🎯 Objetivo do Projeto

O projeto tem como objetivo analisar os processos do estabelecimento e desenvolver uma modelagem de banco de dados capaz de organizar as principais informações relacionadas ao atendimento, pedidos, produtos, mesas, setores e atendentes.

---

## 👥 2. Integrantes

- **Victor Anjos**
- **Thiago Rodrigues**
- **Ricardo Santos**
- **Raphael Luiz**

---

## 🔍 3. Análise e Modelagem

### ⚠️ Identificação do Problema

Durante a análise, foi identificado um problema relacionado ao **controle dos atendentes**, uma vez que atualmente a equipe não é registrada por meio de credenciais.

Essa situação dificulta a identificação do responsável pelo registro dos pedidos e o controle das atividades realizadas no sistema.

### 💡 Solução Proposta

Como solução, foi proposta a criação da entidade **Atendente**, responsável por identificar o funcionário que realiza o registro dos pedidos.

Dessa forma, cada pedido poderá ser associado ao respectivo atendente responsável pelo seu registro.

### 🗺️ Mapeamento de Processos

Foram mapeados os seguintes processos principais do estabelecimento:

- 🛎️ Atendimento ao cliente
- 📝 Registro do pedido
- 🍳 Preparação do pedido
- 🏃 Encaminhamento para a cozinha/bar
- 💳 Pagamento
- 📦 Controle de estoque
- 🧑‍🍳 Cadastro e controle de atendentes

---

## ⚙️ 4. Requisitos e Regras

### 🎯 Requisitos do Sistema

Para orientar o desenvolvimento, o escopo foi dividido em requisitos funcionais e não funcionais:

| Tipo de Requisito | Descrição |
| :--- | :--- |
| **🚀 Funcional** | O sistema deve permitir que o atendente registre um pedido de forma eficiente. |
| **🔒 Não Funcional** | O sistema deve garantir que somente funcionários devidamente autorizados visualizem informações restritas referentes ao bar ou à cozinha. |
| **🛡️ Não Funcional** | O sistema deve possuir controle de acesso, garantindo a segurança e a confidencialidade das informações de acordo com os níveis de permissão de cada usuário. |

### 📜 Regras de Negócio

As seguintes regras operacionais foram estabelecidas para garantir a integridade dos dados:

1. **Rastreabilidade de Pedidos:** Todo pedido deve estar obrigatoriamente associado a um atendente responsável pelo seu registro.

2. **Localização do Cliente:** Todo pedido deve estar vinculado a uma mesa. Não deve existir um pedido sem um número de mesa associado.

3. **Identificação de Produtos:** Todos os produtos cadastrados devem possuir um código de barras para facilitar o registro e o controle de estoque.

---

## 🗄️ 5. Dicionário de Dados

O mapeamento das variáveis do sistema foi estruturado e documentado internamente com base nos parâmetros estabelecidos no portal *Datapsico*.

O modelo de banco de dados relacional é composto pelas seguintes entidades principais:

- **Atendente**
- **Mesa**
- **Pedido**
- **Item_pedido**
- **Produto**
- **Setor**

Cada entidade possui atributos específicos, identificadores e relacionamentos definidos de acordo com as necessidades levantadas durante a análise do estabelecimento.

Os atributos são tipados de acordo com suas características, utilizando tipos como `Integer`, `Varchar`, `Date` e `Decimal`.

O modelo utiliza **Chaves Primárias (PK)** e **Chaves Estrangeiras (FK)** para estabelecer os relacionamentos e garantir a integridade dos dados.

> 📌 O dicionário de dados completo será disponibilizado na documentação do projeto.

[Ver Dicionario](./dicionario_dados_palazio/)

---

## 🔗 6. Diagrama Entidade-Relacionamento

O **Diagrama Entidade-Relacionamento (DER)** representa graficamente as entidades, atributos, relacionamentos e cardinalidades identificados durante a etapa de modelagem.

### 📊 Diagrama

<p align="center">
  <img src="./docs/diagrama-der.png" alt="Diagrama Entidade-Relacionamento do Palazio del Chef" width="900">
</p>

> [Ver Diagrama](./DiagramaPalaziodelChef/).

---

## 🧩 7. Modelo Relacional

A partir do modelo conceitual, será desenvolvido o modelo relacional contendo as tabelas, chaves primárias, chaves estrangeiras e demais restrições necessárias para a implementação do banco de dados.

### Principais entidades

- `Atendente`
- `Pedido`
- `Produto`
- `Mesa`
- `Setor`
- `Historico_Produto`

**Status:** ⏳ Em desenvolvimento

---

## 🧹 8. Normalização

O modelo será analisado de acordo com os princípios de normalização de bancos de dados, buscando reduzir redundâncias e evitar inconsistências nas informações armazenadas.

Serão consideradas as formas normais necessárias para garantir uma estrutura organizada e adequada às necessidades do estabelecimento.

**Status:** ⏳ Em desenvolvimento

---

## 🗃️ 9. Implementação do Banco de Dados

Após a conclusão do modelo lógico, será realizada a implementação do banco de dados utilizando SQL.

Serão consideradas:

- Criação das tabelas;
- Definição das chaves primárias;
- Definição das chaves estrangeiras;
- Restrições de integridade;
- Inserção de dados;
- Consultas SQL.

### 🛠️ Tecnologias e Ferramentas

- **SGBD:** PostgreSQL
- **Linguagem:** SQL
- **Modelagem:** BRModelo
- **Versionamento:** Git e GitHub

**Status:** ⏳ Em desenvolvimento

---

## 📋 10. Consultas SQL

Serão desenvolvidas consultas para manipulação e recuperação das informações armazenadas no banco de dados.

Entre as operações previstas estão:

- `INSERT` — inserção de dados;
- `SELECT` — consulta de dados;
- `UPDATE` — atualização de dados;
- `DELETE` — exclusão de dados;
- `JOIN` — relacionamento entre tabelas.

**Status:** ⏳ Em desenvolvimento

---

## 📁 11. Estrutura do Projeto

```text
Palazio-del-Chef/
│
├── docs/
│   └── diagrama-der.png
│
├── sql/
│   ├── create_tables.sql
│   ├── insert_data.sql
│   └── consultas.sql
│
└── README.md
📌 12. Status do Projeto
Etapa	Status
Contextualização	✅ Concluído
Identificação do problema	✅ Concluído
Requisitos	✅ Concluído
Regras de negócio	✅ Concluído
Dicionário de dados	🔄 Em desenvolvimento
Diagrama Entidade-Relacionamento	🔄 Em desenvolvimento
Modelo relacional	⏳ Pendente
Normalização	⏳ Pendente
Implementação SQL	⏳ Pendente
Consultas SQL	⏳ Pendente
Documentação final	⏳ Pendente

🤖 13. Uso de Inteligência Artificial
Durante o desenvolvimento deste projeto, foi utilizado o ChatGPT (OpenAI) como ferramenta de apoio na organização,
estruturação e revisão da documentação do projeto, especialmente na elaboração e formatação deste arquivo README.md.

A ferramenta foi utilizada como auxílio para melhorar a clareza das informações,
organização das seções, descrição dos conteúdos e padronização da documentação.

As informações referentes ao estabelecimento, requisitos, regras de negócio,entidades,
 atributos e decisões de modelagem foram definidas e revisadas pelos integrantes do grupo.

🎓 14. Contexto Acadêmico
Projeto desenvolvido como atividade acadêmica da disciplina de Modelagem de Banco de Dados,
aplicando conceitos de levantamento de requisitos, modelagem conceitual, entidades, atributos,
relacionamentos, cardinalidade, chaves e normalização.

👥 Equipe
Victor Anjos
Thiago Rodrigues
Ricardo Santos
Raphael Luiz
