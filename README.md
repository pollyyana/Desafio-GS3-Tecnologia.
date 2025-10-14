# 💳 Gerenciamento de Cartões e Finanças

*Desafio GS3 Tecnologia*

Este projeto foi desenvolvido em **Flutter**, simula um sistema de gerenciamento de cartões e transações financeiras.

**Funcionalidade Principal:**
Ao selecionar um cartão na tela principal (**Home**), as listas de **faturas** e **lançamentos** são dinamicamente atualizadas, oferecendo uma visão financeira coesa e em tempo real para o usuário.

---

## ✨ Funcionalidades Adicionais

O projeto inclui funcionalidades de UX e gerenciamento essenciais, como:

* **Ocultar Limite:** Opção para ocultar ou exibir o limite total do cartão na tela principal.
* **Ocultar Lançamentos:** Possibilidade de ocultar os últimos lançamentos exibidos na Home.
* **Logout:** Funcionalidade de sair da conta do usuário.

---

## ⚠️ ATENÇÃO

**A branch principal e mais atualizada do projeto é a `provider`.** Ela utiliza uma arquitetura focada em **Provider** e **SQLite**.

---

## 🌳 Estrutura e Histórico de Branches

### Branch (master) - Versão Inicial

Esta é a primeira versão do projeto, focada em estabelecer a funcionalidade básica utilizando um backend simulado.

**Tecnologias:**
- **GetX** — Gerenciamento de estado e navegação.
- **JSON Server** — Simulação de backend REST.
- **Validatorless** — Validações simples de formulários.

### 💻 Como Iniciar o Backend (JSON Server)

A branch `master` utiliza o **JSON Server** para simular um backend REST.

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

---

### Branch (provider) - Versão Atual (Principal)

Esta é a **versão atual e recomendada** do projeto. Ela migra o gerenciamento de estado para o **Provider** e adota uma arquitetura que prioriza a **separação de responsabilidades**.

**Tecnologias:**
- **Provider** — Gerenciamento de estado e Injeção de Dependência.
- **SQLite (sqflite)** — Banco de dados local para persistência.
- **Validatorless** — Validações de formulários.

---

## 🚀 Foco e Evolução Arquitetural

A branch `provider` representa uma evolução significativa, focando em:

* **Melhor Separação de Responsabilidades:** Para um código mais modular e limpo.
* **Persistência Local:** Migração para **SQLite (sqflite)** para gerenciamento de dados persistentes.
* **Qualidade do Código:** Estrutura organizada e testável, facilitando futuras manutenções.
