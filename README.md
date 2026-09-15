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

Abaixo está o mapeamento das variáveis do sistema, documentado com base nos parâmetros estabelecidos no portal *Datapsico*. 

### 🧑‍🍳 Entidade: Funcionario
| Nome da Variável | Tipo de Variável | Descrição | Valores Permitidos | Nulo? | Anotações |
| :--- | :--- | :--- | :--- | :---: | :--- |
| `id_funcionario` | Numérica (Integer) | Identificador único gerado para cada funcionário no sistema (PK). | Inteiros positivos | ❌ | - |
| `funcao` | Categórica (Varchar) | Indica o cargo de atuação do funcionário (ex: Cozinha, Bar). | Livre (Texto) | ❌ | Fundamental para requisitos de acesso. |
| `nome_funcionario` | Categórica (Varchar) | Nome de registro do colaborador. | Livre (Letras) | ❌ | - |

### 🧾 Entidade: Pedido
| Nome da Variável | Tipo de Variável | Descrição | Valores Permitidos | Nulo? | Anotações |
| :--- | :--- | :--- | :--- | :---: | :--- |
| `numero_pedido` | Numérica (Integer) | Identificador único do pedido solicitado (PK). | Inteiros positivos | ❌ | - |
| `data_pedido` | Tempo (Date) | Data em que ocorreu a abertura do pedido no sistema. | Formato de Data | ❌ | Pode incluir a hora de registro. |
| `forma_pagamento` | Categórica (Varchar) | Método escolhido para a liquidação da conta do pedido. | Crédito, Débito, Dinheiro, Pix | ✅ | Nulo enquanto o cliente não finaliza a conta. |
| `id_funcionario` | Numérica (Integer) | Associa o pedido ao funcionário do atendimento (FK). | IDs cadastrados | ❌ | Regra de Negócio 1. |
| `nmr_mesa` | Numérica (Integer) | Vínculo físico indicando onde os clientes do pedido estão (FK). | Números válidos | ❌ | Regra de Negócio 2. |

### 📦 Entidade: Produto
| Nome da Variável | Tipo de Variável | Descrição | Valores Permitidos | Nulo? | Anotações |
| :--- | :--- | :--- | :--- | :---: | :--- |
| `codigo_barra` | Numérica (Integer) | Identificação baseada no padrão de barras do item (PK). | Padrão numérico | ❌ | Regra de Negócio 3. |
| `nome_produto` | Categórica (Varchar) | Nome oficial de comercialização e cadastro do produto. | Livre (Texto) | ❌ | - |
| `valor_produto` | Numérica (Decimal) | Preço unitário aplicado no ato da venda do produto. | Decimais > 0 | ❌ | - |
| `qt_estoque` | Numérica (Integer) | Saldo físico disponível para o produto em questão. | Inteiros >= 0 | ❌ | Orienta o "Controle de estoque". |
| `nmr_setor` | Numérica (Integer) | Relacionamento com o setor ao qual o produto pertence (FK). | IDs cadastrados | ❌ | - |

### 🔗 Entidade: Item_pedido (Intermediária)
| Nome da Variável | Tipo de Variável | Descrição | Valores Permitidos | Nulo? | Anotações |
| :--- | :--- | :--- | :--- | :---: | :--- |
| `nmr_pedido` | Numérica (Integer) | Informa a qual pedido esta linha de consumo pertence. | ID do pedido | ❌ | Parte da PK Composta. |
| `cdg_produto` | Numérica (Integer) | Informa qual produto foi consumido na respectiva linha. | Código do produto | ❌ | Parte da PK Composta. |
| `qt_produto` | Numérica (Integer) | Representa o volume consumido de determinado produto. | Inteiros > 0 | ❌ | Subtrai montante na `qt_estoque`. |
| `valor_unitario` | Numérica (Decimal) | Congela o preço do produto no momento do registro. | Decimais > 0 | ❌ | Protege o histórico de preços. |

### 🪑 Entidades: Mesa & Setor
| Nome da Variável | Tipo de Variável | Descrição | Valores Permitidos | Nulo? | Anotações |
| :--- | :--- | :--- | :--- | :---: | :--- |
| `numero_mesa` | Numérica (Integer) | Numeração sequencial e física da mesa no salão (PK). | Inteiros > 0 | ❌ | - |
| `id_setor` | Numérica (Integer) | Cadastro único atribuído para cada área operacional (PK). | Inteiros > 0 | ❌ | - |
| `nome_setor` | Categórica (Varchar) | Nomenclatura da área do restaurante. | Ex: Cozinha, Bar | ❌ | - |
