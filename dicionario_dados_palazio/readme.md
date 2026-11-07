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

Como o dicionário descreve o **modelo conceitual**, as tabelas em HTML trazem apenas os atributos que aparecem no DER. As chaves estrangeiras não são listadas ali, porque os vínculos entre as entidades são representados pelas relações do diagrama. As chaves estrangeiras aparecem nas seções 5 e 6 deste documento, como projeção preliminar para o modelo relacional.

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

## RELACIONAMENTOS ENTRE AS ENTIDADES

### 1. Entidades e relações do modelo

O documento contempla as seguintes entidades: **Atendente, Mesa, Pedido, Produto, Setor, Insumo, Pagamento, Forma_Pagamento, Nota_Fiscal, Fornecedor, Compra e Nota_Fiscal_Compra**. A relação **Possui**, entre Pedido e Produto, carrega atributos próprios e por isso é documentada como **Item do Pedido**.

| Relação | Entidades | Cardinalidade | Leitura |
|---|---|---|---|
| **Registra** | Atendente — Pedido | 1:N | Um atendente pode registrar vários pedidos, mas cada pedido é registrado por um único atendente. |
| **Atende** | Mesa — Pedido | 1:N | Uma mesa pode estar associada a vários pedidos ao longo do tempo, mas cada pedido pertence a uma única mesa. |
| **Possui** | Pedido — Produto | N:M | Um pedido pode ter vários produtos e um produto pode aparecer em vários pedidos. A relação guarda quantidade, preço unitário e dados de cancelamento (Item do Pedido). |
| **Designado** | Setor — Produto | 1:N | Um setor pode ser responsável por vários produtos, mas cada produto pertence a um único setor. |
| **referente** | Produto — Insumo | A definir | Relação do DER entre Produto e Insumo. O significado e a cardinalidade ainda serão fechados pelo grupo. |
| **Quita** | Pedido — Pagamento | 1:N | Um pedido pode ter nenhum, um ou vários pagamentos (divisão da conta). Cada pagamento pertence a um único pedido. |
| **Usa** | Forma_Pagamento — Pagamento | 1:N | Uma forma de pagamento pode estar em vários pagamentos, mas cada pagamento usa uma única forma. |
| **Gera** | Pedido — Nota_Fiscal | 1:(0,1) | Um pedido tem no máximo uma nota fiscal, que pode ser registrada depois do pagamento. Cada nota pertence a um único pedido. |
| **refere-se** | Insumo — Compra | 1:N | Um insumo pode aparecer em várias compras, mas cada compra se refere a um único insumo. |
| **contém** | Nota_Fiscal_Compra — Compra | 1:N | Uma nota fiscal de compra contém uma ou mais compras, e cada compra pertence a uma única nota. |
| **emite** | Fornecedor — Nota_Fiscal_Compra | 1:N | Um fornecedor pode emitir várias notas fiscais de compra, mas cada nota é emitida por um único fornecedor. |

Cada entidade possui seus atributos documentados individualmente, acompanhados de suas respectivas descrições e regras de negócio.

### 2. Pontos ainda não confirmados com o gerente

Parte do modelo é hipótese de modelagem, e não informação confirmada na entrevista. Os pontos abaixo serão validados na próxima entrevista:

- **Nota fiscal (cupom):** assume-se que a emissão é feita por sistema externo e que o banco apenas armazena os dados da nota.
- **CPF na nota (`cpf_consumidor`):** assume-se que o CPF é opcional e só é informado quando o cliente pede.
- **Divisão da conta:** o modelo permite vários pagamentos por pedido, divididos por valor (não por item).
- **Limite diário de porções (`limite_diario`):** proposta do grupo para controlar a disponibilidade de pratos.
- **Receita:** por orientação do professor, não há receita no modelo. Pratos como a feijoada são cadastrados como Produto, e o consumo de insumos por prato não é calculado.
- **Estoque mínimo (`qt_minima_insumo`):** proposta do grupo para saber quando repor os insumos. O gerente informou apenas que o estoque é controlado manualmente.
- **Compras e notas de compra:** o gerente informou que o proprietário faz as compras. Quem registra as compras no sistema e como isso é feito ainda será validado.
- **Taxa de serviço e couvert:** não foram modelados, por não terem sido confirmados. Se existirem, serão acrescentados ao pedido.
- **Situação do item (`status`):** os valores possíveis ainda serão definidos.

---

### 3. Legendas e dados.

Esta seção apresenta as siglas, abreviações e convenções utilizadas na documentação do banco de dados do **Palazio del Chef**, facilitando a compreensão das entidades, dos atributos e de suas respectivas regras.

| Sigla           | Termo em inglês       | Significado em português | Descrição                                                                                                          |
| --------------- | --------------------- | ------------------------ | ------------------------------------------------------------------------------------------------------------------ |
| **PK**          | Primary Key           | Chave primária           | Atributo que identifica exclusivamente cada registro de uma tabela. Não pode se repetir nem aceitar valores nulos. |
| **FK**          | Foreign Key           | Chave estrangeira        | Atributo que referencia uma chave de outra tabela, permitindo estabelecer relacionamentos entre entidades.         |
| **PK composta** | Composite Primary Key | Chave primária composta  | Chave primária formada por dois ou mais atributos, cuja combinação identifica exclusivamente um registro.          |

### Prefixos utilizados na nomenclatura

| Termo    | Significado          | Descrição                                                          |
| -------- | -------------------- | ------------------------------------------------------------------ |
| **id_**  | Número identificador | Serve para identificar um registro individualmente.                |
| **qt_**  | Quantidade           | Serve para mostrar uma quantidade de alguma coisa ou de algum item. |

### Tipos de dados e Restrições

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
| **UNIQUE**         | Único                                          | Restrição que impede que dois registros tenham o mesmo valor no atributo.                                                   |

---

### 4. Convenções de nomenclatura

* Os nomes dos atributos devem utilizar letras minúsculas.
* Palavras compostas devem ser separadas por sublinhado (`_`), seguindo o padrão `snake_case`.
* Devem ser evitados espaços, acentos e caracteres especiais nos nomes dos atributos.
* As siglas **PK** e **FK** identificam, respectivamente, chaves primárias e estrangeiras na documentação.
* Os tipos de dados e as restrições devem ser definidos de acordo com o modelo do banco de dados e o sistema gerenciador escolhido.

**Observação:** esta legenda documenta as convenções adotadas no projeto. A utilização efetiva de tipos, restrições e recursos como `AUTO_INCREMENT` dependerá da implementação do banco de dados.

---

### 5. Expressão formal do modelo de dados

Esta seção apresenta a representação formal preliminar do modelo de dados do sistema Palazio del Chef, identificando as entidades, seus atributos, as chaves primárias (PK), as chaves estrangeiras (FK) e os relacionamentos entre as entidades.

As chaves estrangeiras listadas aqui resultam das relações do DER conceitual e fazem parte da projeção preliminar para o modelo relacional. Elas não são desenhadas no DER.

### 5.1. Representação das entidades

- **ATENDENTE** (`id_atendente` PK, `nome_atendente`)
- **MESA** (`nmr_mesa` PK)
- **PEDIDO** (`num_pedido` PK, `data_hora_pedido`, `maioridade_confirmada`, `id_atendente` FK, `nmr_mesa` FK)
- **ITEM_PEDIDO** (`num_pedido` PK/FK, `codigo_produto` PK/FK, `qt_produto`, `preco_unitario`, `status`, `motivo_cancelamento`, `data_hora_cancelamento`)
- **PRODUTO** (`codigo_produto` PK, `nome_produto`, `preco_atual`, `limite_diario`, `bebida_alcoolica`, `id_setor` FK)
- **SETOR** (`id_setor` PK, `nome_setor`)
- **INSUMO** (`id_insumo` PK, `nome_insumo`, `qt_insumo`, `unidade_insumo`, `qt_minima_insumo`)
- **FORMA_PAGAMENTO** (`id_forma_pagamento` PK, `descricao`)
- **PAGAMENTO** (`id_pagamento` PK, `num_pedido` FK, `id_forma_pagamento` FK, `data_hora_pagamento`, `valor_pago`)
- **NOTA_FISCAL** (`id_nota_fiscal` PK, `num_pedido` FK, `numero_nota`, `serie`, `data_emissao`, `valor_total`, `chave_acesso`, `cpf_consumidor`)
- **FORNECEDOR** (`id_fornecedor` PK, `razao_social`, `cnpj`, `endereco`, `telefone`)
- **COMPRA** (`id_compra` PK, `id_insumo` FK, `id_nota_compra` FK, `quantidade`, `valor_unitario`, `desconto`)
- **NOTA_FISCAL_COMPRA** (`id_nota_compra` PK, `id_fornecedor` FK, `numero_nota`, `serie`, `chave_acesso`, `data_emissao`, `data_entrada`, `valor_total`)

A chave estrangeira da relação **referente** (Produto — Insumo) ainda não aparece nesta lista, porque depende da cardinalidade, que será definida pelo grupo.

### 5.2. Representação dos relacionamentos

| Entidades | Cardinalidade | Descrição | Chave estrangeira no modelo relacional |
|---|---|---|---|
| **ATENDENTE — PEDIDO** | 1:N | Um atendente pode registrar vários pedidos, enquanto cada pedido é associado a um único atendente. | `id_atendente` em PEDIDO |
| **MESA — PEDIDO** | 1:N | Uma mesa pode estar associada a vários pedidos ao longo do tempo, enquanto cada pedido é associado a uma única mesa. | `nmr_mesa` em PEDIDO |
| **PEDIDO — PRODUTO** | N:M | Um pedido pode ter vários produtos e um produto pode estar em vários pedidos. | Tabela ITEM_PEDIDO, com `num_pedido` e `codigo_produto` |
| **SETOR — PRODUTO** | 1:N | Um setor pode estar associado a vários produtos, enquanto cada produto é associado a um único setor. | `id_setor` em PRODUTO |
| **PRODUTO — INSUMO** | A definir | Relação **referente** do DER. O significado e a cardinalidade ainda serão fechados pelo grupo. | A definir |
| **PEDIDO — PAGAMENTO** | 1:N | Um pedido pode ter zero ou vários pagamentos, enquanto cada pagamento está associado a um único pedido. | `num_pedido` em PAGAMENTO |
| **FORMA_PAGAMENTO — PAGAMENTO** | 1:N | Uma forma de pagamento pode ser usada em vários pagamentos, enquanto cada pagamento usa uma única forma. | `id_forma_pagamento` em PAGAMENTO |
| **PEDIDO — NOTA_FISCAL** | 1:(0,1) | Um pedido tem no máximo uma nota fiscal, e cada nota pertence a um único pedido. | `num_pedido` (único) em NOTA_FISCAL |
| **INSUMO — COMPRA** | 1:N | Um insumo pode aparecer em várias compras, enquanto cada compra se refere a um único insumo. | `id_insumo` em COMPRA |
| **NOTA_FISCAL_COMPRA — COMPRA** | 1:N | Uma nota fiscal de compra contém uma ou mais compras, enquanto cada compra pertence a uma única nota. | `id_nota_compra` em COMPRA |
| **FORNECEDOR — NOTA_FISCAL_COMPRA** | 1:N | Um fornecedor pode emitir várias notas fiscais de compra, enquanto cada nota é emitida por um único fornecedor. | `id_fornecedor` em NOTA_FISCAL_COMPRA |

### 5.3. Restrições gerais

- Cada entidade possui uma chave primária destinada a identificar unicamente seus registros.
- As chaves estrangeiras representam os vínculos entre as entidades relacionadas.
- Os relacionamentos devem respeitar as cardinalidades definidas no modelo conceitual.
- A obrigatoriedade e os valores permitidos para cada atributo são detalhados no dicionário de dados.
- A soma dos pagamentos de um pedido não deve ultrapassar o valor total devido por ele (itens não cancelados).

---

### 6. Estrutura técnica dos atributos

As chaves estrangeiras desta seção são uma projeção preliminar para o modelo relacional. Os tipos de dados são preliminares e dependem do sistema gerenciador escolhido.

### Entidade: ATENDENTE

| Atributo             | Tipo         | Obrigatório      | Significado e relevância                                                                                                  |
| -------------------- | ------------ | ---------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `id_atendente` (PK)  | INT          | Sim (`NOT NULL`) | Identificador único de cada atendente. É a chave primária (PK) e permite distinguir os atendentes cadastrados no sistema. |
| `nome_atendente`     | VARCHAR(100) | Sim (`NOT NULL`) | Armazena o nome do atendente. Permite identificar qual atendente está associado a um pedido.                              |

---

### Entidade: MESA

| Atributo          | Tipo | Obrigatório      | Significado e relevância                                                                                                                        |
| ----------------- | ---- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------- |
| `nmr_mesa` (PK)   | INT  | Sim (`NOT NULL`) | Número que identifica exclusivamente cada mesa do estabelecimento. É a chave primária (PK) e permite associar os pedidos à mesa correspondente. |

---

### Entidade: PEDIDO

| Atributo                | Tipo     | Obrigatório      | Significado e relevância                                                                                                                   |
| ----------------------- | -------- | ---------------- | ------------------------------------------------------------------------------------------------------------------------------------------ |
| `num_pedido` (PK)       | INT      | Sim (`NOT NULL`) | Identificador único de cada pedido. É a chave primária (PK) e permite distinguir os pedidos registrados no sistema.                        |
| `data_hora_pedido`      | DATETIME | Sim (`NOT NULL`) | Registra a data e o horário em que o pedido foi realizado. Pode utilizar a data e a hora atuais como valor padrão.                         |
| `maioridade_confirmada` | BOOLEAN  | Sim (`NOT NULL`) | Indica se o atendente confirmou a maioridade do cliente para itens alcoólicos. É só uma marcação (sim ou não) e não guarda dados do documento. |
| `id_atendente` (FK)     | INT      | Sim (`NOT NULL`) | Identifica o atendente responsável pelo pedido. É uma chave estrangeira (FK) relacionada ao atributo `id_atendente` da entidade ATENDENTE. |
| `nmr_mesa` (FK)         | INT      | Sim (`NOT NULL`) | Identifica a mesa associada ao pedido. É uma chave estrangeira (FK) relacionada ao atributo `nmr_mesa` da entidade MESA.                   |

---

### Entidade: ITEM_PEDIDO (relação Possui)

| Atributo                    | Tipo          | Obrigatório                          | Significado e relevância                                                                                                                         |
| --------------------------- | ------------- | ------------------------------------ | ------------------------------------------------------------------------------------------------------------------------------------------------ |
| `num_pedido` (PK, FK)       | INT           | Sim (`NOT NULL`)                     | Identifica o pedido ao qual o item pertence. Faz parte da chave primária composta e referencia `num_pedido` em PEDIDO.                           |
| `codigo_produto` (PK, FK)   | INT           | Sim (`NOT NULL`)                     | Identifica o produto pedido. Faz parte da chave primária composta e referencia `codigo_produto` em PRODUTO.                                      |
| `qt_produto`                | INT           | Sim (`NOT NULL`)                     | Quantidade do produto solicitada no pedido. Deve ser maior que zero.                                                                             |
| `preco_unitario`            | DECIMAL(10,2) | Sim (`NOT NULL`)                     | Preço do produto no momento do pedido. Não muda se o `preco_atual` do produto for alterado depois.                                               |
| `status`                    | VARCHAR(20)   | Sim (`NOT NULL`)                     | Situação do item no pedido (por exemplo, ativo ou cancelado). Itens cancelados não entram no valor a pagar.                                      |
| `motivo_cancelamento`       | VARCHAR(200)  | Não (`NULL` permitido)               | Motivo do cancelamento do item. Só é preenchido quando o item é cancelado.                                                                       |
| `data_hora_cancelamento`    | DATETIME      | Não (`NULL` permitido)               | Data e horário do cancelamento do item. Só é preenchida quando o item é cancelado.                                                               |

---

### Entidade: PRODUTO

| Atributo               | Tipo          | Obrigatório            | Significado e relevância                                                                                                                                       |
| ---------------------- | ------------- | ---------------------- | -------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `codigo_produto` (PK)  | INT           | Sim (`NOT NULL`)       | Identificador único de cada produto cadastrado. É a chave primária (PK) e permite distinguir um produto dos demais.                                            |
| `nome_produto`         | VARCHAR(100)  | Sim (`NOT NULL`)       | Armazena o nome do produto, permitindo identificá-lo nos pedidos e no cadastro do estabelecimento.                                                             |
| `preco_atual`          | DECIMAL(10,2) | Sim (`NOT NULL`)       | Armazena o preço atual de venda do produto, utilizado como referência para calcular o valor dos pedidos.                                                       |
| `limite_diario`        | INT           | Não (`NULL` permitido) | Quantidade máxima de porções vendidas por dia. Valor nulo significa sem limite. As vendas do dia são calculadas a partir dos itens de pedido, sem duplicar dado. |
| `bebida_alcoolica`     | BOOLEAN       | Sim (`NOT NULL`)       | Indica se o produto é uma bebida alcoólica. Produtos marcados como alcoólicos exigem a conferência de maioridade do cliente antes do registro no pedido. |
| `id_setor` (FK)        | INT           | Sim (`NOT NULL`)       | Identifica o setor responsável pelo produto, relacionando-o à entidade SETOR por meio de uma chave estrangeira (FK).                                           |

---

### Entidade: SETOR

| Atributo         | Tipo        | Obrigatório      | Significado e relevância                                                                                                                                                                              |
| ---------------- | ----------- | ---------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id_setor` (PK)  | INT         | Sim (`NOT NULL`) | Identificador único de cada setor do estabelecimento. É a chave primária (PK) e permite distinguir os setores cadastrados no sistema.                                                                 |
| `nome_setor`     | VARCHAR(50) | Sim (`NOT NULL`) | Armazena o nome do setor responsável pelo preparo ou atendimento dos produtos. No projeto, os setores definidos são Bar e Cozinha. Permite identificar para qual setor cada produto está direcionado. |

---

### Entidade: INSUMO

A chave estrangeira da relação **referente** (Produto — Insumo) será acrescentada aqui quando a cardinalidade for definida.

| Atributo              | Tipo          | Obrigatório      | Significado e relevância                                                                                                                                                     |
| --------------------- | ------------- | ---------------- | ---------------------------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id_insumo` (PK)      | INT           | Sim (`NOT NULL`) | Identificador único de cada insumo cadastrado no sistema. É a chave primária (PK).                                                                                           |
| `nome_insumo`         | VARCHAR(100)  | Sim (`NOT NULL`) | Nome do insumo, como aparece no estoque (por exemplo, coca-cola lata ou arroz).                                                                                              |
| `qt_insumo`           | DECIMAL(10,2) | Sim (`NOT NULL`) | Quantidade do insumo disponível no estoque. Pode ser zero, mas não pode ser negativa. Aceita casas decimais por causa de unidades como kg e litro.                          |
| `unidade_insumo`      | VARCHAR(20)   | Sim (`NOT NULL`) | Unidade em que o insumo é medido (por exemplo, unidade, kg ou litro).                                                                                                        |
| `qt_minima_insumo`    | DECIMAL(10,2) | Sim (`NOT NULL`) | Quantidade mínima que o estabelecimento quer manter em estoque. Quando `qt_insumo` ficar abaixo desse valor, o insumo precisa ser reposto. Não pode ser negativa.            |

---

### Entidade: FORMA_PAGAMENTO

| Atributo                    | Tipo        | Obrigatório                | Significado e relevância                                                                                                  |
| --------------------------- | ----------- | -------------------------- | ------------------------------------------------------------------------------------------------------------------------- |
| `id_forma_pagamento` (PK)   | INT         | Sim (`NOT NULL`)           | Identificador único de cada forma de pagamento aceita pelo estabelecimento.                                               |
| `descricao`                 | VARCHAR(30) | Sim (`NOT NULL`, `UNIQUE`) | Nome da forma de pagamento (dinheiro, crédito, débito, Pix...). Padroniza o cadastro e evita variações de digitação.      |

---

### Entidade: PAGAMENTO

| Atributo                      | Tipo          | Obrigatório                                | Significado e relevância                                                                                                  |
| ----------------------------- | ------------- | ------------------------------------------ | ------------------------------------------------------------------------------------------------------------------------- |
| `id_pagamento` (PK)           | INT           | Sim (`NOT NULL`)                           | Identificador único de cada pagamento registrado no sistema. É a chave primária (PK).                                     |
| `num_pedido` (FK)             | INT           | Sim (`NOT NULL`)                           | Identifica o pedido ao qual o pagamento pertence. Referencia `num_pedido` na entidade PEDIDO.                             |
| `id_forma_pagamento` (FK)     | INT           | Sim (`NOT NULL`)                           | Identifica a forma utilizada no pagamento. Referencia `id_forma_pagamento` na entidade FORMA_PAGAMENTO.                   |
| `data_hora_pagamento`         | DATETIME      | Sim para pagamentos concluídos (`NOT NULL`) | Registra a data e o horário em que o pagamento foi realizado.                                                             |
| `valor_pago`                  | DECIMAL(10,2) | Sim (`NOT NULL`)                           | Armazena o valor correspondente ao pagamento registrado. Deve ser maior que zero.                                         |

---

### Entidade: NOTA_FISCAL

| Atributo                  | Tipo          | Obrigatório                | Significado e relevância                                                                                                                                  |
| ------------------------- | ------------- | -------------------------- | --------------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id_nota_fiscal` (PK)     | INT           | Sim (`NOT NULL`)           | Identificador único de cada registro de nota fiscal no sistema.                                                                                           |
| `num_pedido` (FK)         | INT           | Sim (`NOT NULL`, `UNIQUE`) | Identifica o pedido ao qual a nota pertence. Referencia `num_pedido` em PEDIDO. Deve ser único, garantindo no máximo uma nota por pedido.                 |
| `numero_nota`             | INT           | Sim (`NOT NULL`)           | Número do cupom ou nota fiscal emitido por sistema externo.                                                                                               |
| `serie`                   | INT           | Sim (`NOT NULL`)           | Série da nota fiscal emitida.                                                                                                                             |
| `data_emissao`            | DATE          | Sim (`NOT NULL`)           | Data em que a nota foi emitida. A nota é registrada depois da emissão e não impede o registro do pagamento.                                               |
| `valor_total`             | DECIMAL(10,2) | Sim (`NOT NULL`)           | Valor total que consta na nota emitida.                                                                                                                   |
| `chave_acesso`            | VARCHAR(44)   | Sim (`NOT NULL`, `UNIQUE`) | Chave de acesso que identifica a nota perante o órgão fiscal.                                                                                             |
| `cpf_consumidor`          | VARCHAR(11)   | Não (`NULL` permitido)     | CPF do consumidor, informado na nota apenas quando o cliente pede. Sem pontos ou traços. É um dado pessoal e só deve ser guardado a pedido do cliente.   |

---

### Entidade: FORNECEDOR

| Atributo               | Tipo         | Obrigatório                | Significado e relevância                                                                                       |
| ---------------------- | ------------ | -------------------------- | -------------------------------------------------------------------------------------------------------------- |
| `id_fornecedor` (PK)   | INT          | Sim (`NOT NULL`)           | Identificador único de cada fornecedor cadastrado no sistema.                                                  |
| `razao_social`         | VARCHAR(150) | Sim (`NOT NULL`)           | Nome empresarial do fornecedor.                                                                                |
| `cnpj`                 | VARCHAR(14)  | Sim (`NOT NULL`, `UNIQUE`) | CNPJ do fornecedor, sem pontuação. Garante que o mesmo fornecedor não seja cadastrado duas vezes.              |
| `endereco`             | VARCHAR(200) | Não (`NULL` permitido)     | Endereço do fornecedor.                                                                                        |
| `telefone`             | VARCHAR(20)  | Não (`NULL` permitido)     | Telefone de contato do fornecedor.                                                                             |

---

### Entidade: COMPRA

| Atributo                 | Tipo          | Obrigatório            | Significado e relevância                                                                                                                              |
| ------------------------ | ------------- | ---------------------- | ----------------------------------------------------------------------------------------------------------------------------------------------------- |
| `id_compra` (PK)         | INT           | Sim (`NOT NULL`)       | Identificador único de cada compra de insumo registrada no sistema.                                                                                   |
| `id_insumo` (FK)         | INT           | Sim (`NOT NULL`)       | Identifica o insumo comprado. Referencia `id_insumo` em INSUMO. Cada compra se refere a um único insumo.                                              |
| `id_nota_compra` (FK)    | INT           | Sim (`NOT NULL`)       | Identifica a nota fiscal de compra à qual a compra pertence. Referencia `id_nota_compra` em NOTA_FISCAL_COMPRA.                                       |
| `quantidade`             | DECIMAL(10,2) | Sim (`NOT NULL`)       | Quantidade do insumo comprada. Deve ser maior que zero.                                                                                               |
| `valor_unitario`         | DECIMAL(10,2) | Sim (`NOT NULL`)       | Valor pago por unidade do insumo no momento da compra. Não pode ser negativo. É o preço de compra, diferente do preço de venda do produto.            |
| `desconto`               | DECIMAL(10,2) | Não (`NULL` permitido) | Valor de desconto concedido pelo fornecedor. Quando informado, não pode ser negativo nem maior que `quantidade` × `valor_unitario`.                   |

---

### Entidade: NOTA_FISCAL_COMPRA

| Atributo                    | Tipo          | Obrigatório                | Significado e relevância                                                                                                           |
| --------------------------- | ------------- | -------------------------- | ---------------------------------------------------------------------------------------------------------------------------------- |
| `id_nota_compra` (PK)       | INT           | Sim (`NOT NULL`)           | Identificador único de cada nota fiscal de compra registrada no sistema.                                                           |
| `id_fornecedor` (FK)        | INT           | Sim (`NOT NULL`)           | Identifica o fornecedor que emitiu a nota. Referencia `id_fornecedor` em FORNECEDOR. Toda nota deve ter um fornecedor cadastrado.  |
| `numero_nota`               | INT           | Sim (`NOT NULL`)           | Número da nota fiscal emitida pelo fornecedor.                                                                                     |
| `serie`                     | INT           | Sim (`NOT NULL`)           | Série da nota fiscal emitida pelo fornecedor.                                                                                      |
| `chave_acesso`              | VARCHAR(44)   | Sim (`NOT NULL`, `UNIQUE`) | Chave de acesso que identifica a nota perante o órgão fiscal.                                                                      |
| `data_emissao`              | DATE          | Sim (`NOT NULL`)           | Data em que o fornecedor emitiu a nota.                                                                                            |
| `data_entrada`              | DATE          | Sim (`NOT NULL`)           | Data em que os insumos da nota chegaram ao estabelecimento. Não pode ser anterior à data de emissão.                               |
| `valor_total`               | DECIMAL(10,2) | Sim (`NOT NULL`)           | Valor total que consta na nota fiscal de compra. Deve ser maior que zero.                                                          |

---

## 7. Log e auditoria de pedidos

O log é um registro cronológico dos acontecimentos relacionados aos pedidos. Sua finalidade é permitir o acompanhamento das ações realizadas durante o atendimento, facilitando a consulta ao histórico e a identificação de possíveis problemas.

**Esta funcionalidade é uma proposta de melhoria para o sistema, não uma funcionalidade confirmada como existente no estabelecimento.**

### Eventos que poderão ser registrados

| Evento | Informações que poderão ser registradas |
|---|---|
| Criação do pedido | Número do pedido, data e horário de criação e atendente responsável. |
| Encaminhamento do pedido | Número do pedido, setor de destino (Bar ou Cozinha) e data e horário do encaminhamento. |
| Cancelamento de item | Número do pedido, produto, motivo e data e horário do cancelamento. |
| Registro do pagamento | Número do pedido, data e horário do pagamento e forma de pagamento. |
| Registro da nota fiscal | Número do pedido, número da nota e data de emissão. |

### Regras propostas

- Os registros deverão seguir uma ordem cronológica.
- Cada evento deverá estar associado ao pedido correspondente.
- Os registros deverão conter a data e o horário do acontecimento.
- O histórico deverá permitir consultar os eventos registrados para um pedido.
- Os registros deverão ser protegidos contra alterações indevidas, preservando a confiabilidade do histórico.

### Observações

O registro desses eventos depende da implementação de uma funcionalidade específica de log. O modelo de dados atual ainda não contempla uma estrutura própria para armazenar o histórico dos acontecimentos. Os dados de cancelamento de item e de pagamento já ficam guardados nas próprias tabelas ITEM_PEDIDO e PAGAMENTO, mas isso não substitui um histórico de eventos.

O registro do encaminhamento aos setores também poderá exigir ajustes no modelo, pois um pedido pode envolver tanto a Cozinha quanto o Bar.

---

## 8. Índices do Banco de Dados

Os índices são estruturas utilizadas para otimizar a localização e a recuperação de informações no banco de dados. Sua utilização contribui para melhorar o desempenho das consultas, principalmente em atributos frequentemente utilizados em pesquisas e relacionamentos entre entidades.

### 8.1. Índices definidos

| Índice | Entidade e atributo | Finalidade |
|---|---|---|
| `idx_pedido_nmr_mesa` | PEDIDO (`nmr_mesa`) | Otimizar as consultas de pedidos associados a uma mesa específica. |
| `idx_pedido_id_atendente` | PEDIDO (`id_atendente`) | Otimizar as consultas de pedidos registrados por um determinado atendente. |
| `idx_item_pedido_codigo_produto` | ITEM_PEDIDO (`codigo_produto`) | Facilitar a consulta dos itens por produto, como no cálculo das vendas do dia para o limite diário. |
| `idx_produto_nome` | PRODUTO (`nome_produto`) | Facilitar a localização de produtos por meio de seu nome. |
| `idx_produto_id_setor` | PRODUTO (`id_setor`) | Otimizar as consultas de produtos associados a um setor, como cozinha ou bar. |
| `idx_pagamento_num_pedido` | PAGAMENTO (`num_pedido`) | Facilitar a consulta dos pagamentos associados a um pedido. |
| `idx_pagamento_id_forma_pagamento` | PAGAMENTO (`id_forma_pagamento`) | Facilitar relatórios de pagamentos por forma, como o fechamento do caixa. |
| `idx_compra_id_insumo` | COMPRA (`id_insumo`) | Facilitar a consulta das compras de um determinado insumo. |
| `idx_compra_id_nota_compra` | COMPRA (`id_nota_compra`) | Facilitar a consulta das compras que fazem parte de uma nota fiscal de compra. |
| `idx_nota_fiscal_compra_id_fornecedor` | NOTA_FISCAL_COMPRA (`id_fornecedor`) | Facilitar a consulta das notas de compra emitidas por um fornecedor. |

### 8.2. Critérios de utilização

A definição dos índices considera as principais operações de consulta relacionadas ao funcionamento do Palazio del Chef, incluindo a localização de pedidos por mesa, a identificação dos pedidos registrados por atendentes, a pesquisa de produtos, a organização dos produtos por setor, a consulta de pagamentos e a consulta de compras e notas de compra.

As chaves primárias também possuem função de identificação única dos registros e, nos sistemas gerenciadores de banco de dados mais utilizados, normalmente recebem índices automaticamente. O mesmo costuma acontecer com atributos marcados como `UNIQUE` (como `num_pedido` em NOTA_FISCAL, `chave_acesso` em NOTA_FISCAL_COMPRA e `cnpj` em FORNECEDOR), por isso não foram criados índices adicionais para eles. A criação de índices adicionais deve considerar as necessidades de consulta e evitar estruturas redundantes.

A aplicação dos índices deve respeitar as características do sistema gerenciador de banco de dados utilizado e a estrutura física adotada na implementação.

---

## 9. Proteção de Dados e LGPD

O projeto Palazio del Chef considera a importância da proteção dos dados pessoais utilizados pelo sistema, tendo como referência a Lei Geral de Proteção de Dados Pessoais (LGPD — Lei nº 13.709/2018).

### Diretrizes propostas

- **Finalidade:** utilizar os dados armazenados somente para finalidades definidas e compatíveis com o funcionamento do sistema.
- **Necessidade:** armazenar apenas as informações necessárias para o registro e o acompanhamento dos pedidos.
- **Segurança:** propor medidas para impedir que pessoas não autorizadas acessem, alterem ou divulguem informações armazenadas.
- **Privacidade:** evitar o armazenamento desnecessário de dados pessoais de clientes e atendentes.
- **CPF na nota fiscal:** o `cpf_consumidor` é um dado pessoal opcional. Ele só é guardado quando o cliente pede o CPF na nota. Se o cliente não quiser, a venda segue normalmente e o campo fica vazio. Isso é diferente da conferência de maioridade, em que nenhum dado do documento é armazenado.
- **Dados fictícios:** utilizar informações fictícias nos exemplos e documentos acadêmicos, evitando a exposição de dados reais de clientes ou funcionários.

### Observação

As diretrizes descritas representam cuidados previstos para o projeto. A implementação efetiva das medidas de segurança e a avaliação da conformidade com a LGPD dependem do desenvolvimento do sistema e das práticas adotadas pelo estabelecimento.

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
