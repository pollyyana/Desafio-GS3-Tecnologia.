# 💳 Gerenciamento de Cartões e Finanças

*Desafio GS3 Tecnologia*

Este projeto foi desenvolvido em **Flutter**, simula um sistema de gerenciamento de cartões e transações financeiras.

## ⚠️ ATENÇÃO

**A branch principal e mais atualizada do projeto é a `provider`.** Ela utiliza uma arquitetura focada em **Provider** e **SQLite**.

---


**Funcionalidade Principal:**
Ao selecionar um cartão na tela principal (**Home**), as listas de **faturas** e **lançamentos** são dinamicamente atualizadas, oferecendo uma visão financeira coesa e em tempo real para o usuário.

---
## Funcionalidades Adicionais

O projeto inclui funcionalidades de UX e gerenciamento essenciais, como:

* **Ocultar Limite Cartão:** Opção para ocultar ou exibir o limite total do cartão na tela principal.
* **Ocultar Lançamentos:** Possibilidade de ocultar os últimos lançamentos exibidos na Home.
* **Logout:** Funcionalidade para sair da conta do usuário.

---



### Branch (master) - Versão Inicial

Esta é a primeira versão do projeto, focada em estabelecer a funcionalidade básica utilizando um backend simulado.

**Comportamento de Atualização:**
Para que as faturas e lançamentos sejam atualizados na Home, é necessário **clicar** no cartão selecionado.

**Tecnologias:**
- **GetX** — Gerenciamento de estado e navegação.
- **JSON Server** — Simulação de backend REST.
- **Validatorless** — Validações simples de formulários.

### Como Iniciar o Backend (Json Rest Server)

A branch `master` utiliza o package **Json Rest Server** para simular um backend REST.

1.  **Acesse a pasta:**
    ```bash
    cd backend
    ```
2.  **Ative o pacote globalmente (apenas na primeira vez):**
    ```bash
    dart pub global activate json_rest_server
    ```
3.  **Inicie o servidor:**
    ```bash
    jrs run
    ```
O servidor estará rodando em `http://localhost:8080/users`.

*Adicionar o ip da maquina na classe ApiClient baseUrl = 'http://000.000.15.6:8080';*

**Acesso: cpf 06408414141  senha 123123**

---

### Branch (provider) - Versão Atual (Principal)

Esta é a **versão atual e recomendada** do projeto. Ela migra o gerenciamento de estado para o **Provider** e adota uma arquitetura que prioriza a **separação de responsabilidades** e a persistência local.

**Comportamento de Atualização:**
A atualização de faturas e lançamentos na Home ocorre **automaticamente** ao deslizar (scroll) entre os cartões.

**Tecnologias:**
- **Provider** — Gerenciamento de estado e Injeção de Dependência.
- **SQLite (sqflite)** — Banco de dados local para persistência.
- **Validatorless** — Validações de formulários.
  
**acesso: cpf 064.084.141-41  senha 123123**

---

## 🚀 Foco e Evolução Arquitetural

A branch `provider` representa uma evolução significativa, focando em:

* **Melhor Separação de Responsabilidades:** Para um código mais modular e limpo.
* **Persistência Local:** Migração para **SQLite (sqflite)** para gerenciamento de dados persistentes.
* **Qualidade do Código:** Estrutura organizada e testável, facilitando futuras manutenções.

---

# Estrutura e Histórico de Branches

| Branch | Objetivo | Gerenciamento de Estado | Backend/Persistência | Observação Principal |
| :--- | :--- | :--- | :--- | :--- |
| `master` | Primeira versão e prova de conceito | GetX | JSON Server (Simulado) | Requer **clique** para atualização de faturas. |
| `provider` | Versão atual, otimizada e principal | Provider | SQLite (Local) | Atualização de faturas **automática** ao realizar o scroll. |
