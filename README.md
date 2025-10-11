# Desafio GS3 Tecnologia

Este projeto está sendo desenvolvido em Flutter, com foco em simular o gerenciamento de cartões e transações financeiras.

---

## Estrutura de Branches

### Branch (master)
Primeira versão do projeto.

**Tecnologias utilizadas:**
- GetX — gerenciamento de estado e navegação  
- JSON Server — simulação de backend REST  
- Validatorless — validações simples de formulários  

---

### Branch (provider)
Versão atual em desenvolvimento, com uma nova arquitetura baseada em MVVM.

**Tecnologias utilizadas:**
- Provider — gerenciamento de estado e injeção de dependência  
- SQLite (sqflite) — banco de dados local  
- Validatorless — validações de formulários  

---

## Objetivo

A branch `provider` representa uma evolução do projeto, com foco em:

- Melhor separação de responsabilidades (MVVM)  
- Persistência local utilizando SQLite  
- Código mais limpo, organizado e testável
