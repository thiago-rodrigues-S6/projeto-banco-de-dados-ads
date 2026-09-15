# 🍽️ Projeto: Palazio del Chef

<p align="center">
  <img src="https://img.shields.io/badge/Status-Em%20Andamento-yellow?style=for-the-badge" alt="Status">
  <img src="https://img.shields.io/badge/Banco_de_Dados-Relacional-blue?style=for-the-badge&logo=mysql" alt="Database">
  <img src="https://img.shields.io/badge/Documenta%C3%A7%C3%A3o-Datapsico-orange?style=for-the-badge" alt="Docs">
</p>

---

## 📖 1. Contextualização e Visão Geral

### 📍 O Estabelecimento
O **Palazio del Chef** é um estabelecimento do segmento de alimentação com características de restaurante e bar. Possui um médio porte e apresenta um fluxo considerável de clientes. A escolha deste estabelecimento para o projeto ocorreu justamente por ele apresentar uma estrutura operacional e de processos bem elaborada.

---

## 🔍 2. Análise e Modelagem

### ⚠️ Identificação do Problema e Soluções
Durante a análise, foi identificado um problema focado no **controle de funcionários**, uma vez que, atualmente, a equipe não é registrada por meio de credenciais.

> **💡 Solução Proposta:** Foi proposta a criação de uma entidade *Funcionário* no modelo de dados, com o objetivo de organizar e rastrear essas informações, garantindo que o sistema funcione de forma segura e adequada.

### 🗺️ Mapeamento de Processos
Foram mapeados os seguintes processos principais do restaurante, essenciais para o fluxo do sistema:
- 🛎️ Atendimento ao cliente
- 📝 Registro do pedido
- 🍳 Preparação do pedido
- 🏃 Encaminhamento para a cozinha/bar
- 💳 Pagamento
- 📦 Controle de estoque
- 🧑‍🍳 Cadastro e controle de funcionários

---

## ⚙️ 3. Requisitos e Regras

### 🎯 Requisitos do Sistema
Para orientar o desenvolvimento, o escopo foi dividido em requisitos funcionais e não funcionais:

| Tipo de Requisito | Descrição |
| :--- | :--- |
| **🚀 Funcional** | O sistema deve permitir que o funcionário consiga registrar um pedido de forma eficiente. |
| **🔒 Não Funcional** | O sistema deve garantir que somente funcionários devidamente autorizados visualizem informações restritas referentes ao bar ou à cozinha. |
| **🛡️ Não Funcional** | O sistema deve possuir um rigoroso controle de acesso, garantindo a segurança e a confidencialidade das informações, respeitando os níveis de permissão que cada usuário possui. |

### 📜 Regras de Negócio
As seguintes regras operacionais foram estabelecidas para garantir a integridade dos dados:
1. **Rastreabilidade de Pedidos:** Todo pedido precisa estar obrigatoriamente associado a um funcionário. Não é possível que existam pedidos no sistema sem que um funcionário o tenha registrado.
2. **Localização do Cliente:** Todo pedido precisa estar vinculado a uma mesa. Não existe um pedido que não tenha um número de mesa associado a ele.
3. **Identificação de Mercadorias:** Todos os produtos cadastrados devem possuir um código de barras para facilitar o registro e o controle de estoque.

---

## 🗄️ 4. Dicionário de Dados

O mapeamento das variáveis do sistema foi estruturado e documentado internamente com base nos parâmetros estabelecidos no portal *Datapsico*. 

Para manter a documentação da página principal concisa e de fácil navegação, o dicionário detalhado foi abstraído. De forma resumida, o modelo de banco de dados relacional é composto pelas entidades principais: **Funcionario**, **Pedido**, **Produto**, **Mesa** e **Setor**, além da tabela intermediária **Item_pedido**. 

Cada uma destas entidades possui seus atributos rigorosamente tipados (como `Integer`, `Varchar`, `Date` e `Decimal`), regras de restrição de valores nulos (NOT NULL) e controle estrito de relacionamentos. O modelo utiliza identificadores únicos (Chaves Primárias - PK) e mapeamento de chaves estrangeiras (FK) para garantir a integridade referencial dos dados, assegurando que todas as regras de negócio mencionadas anteriormente sejam cumpridas pelo sistema.
