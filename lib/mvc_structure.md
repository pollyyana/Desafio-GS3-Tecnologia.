# Estrutura MVC - GS3 Tecnologia

## Organização Lógica do Projeto

Este projeto segue o padrão MVC (Model-View-Controller) com a seguinte organização:

### 📁 Estrutura de Pastas

```
lib/
├── app/
│   ├── core/                    # Utilitários e configurações
│   │   ├── api/                 # API Client
│   │   ├── error/               # Tratamento de erros
│   │   ├── helpers/             # Helpers e mixins
│   │   └── widgets/             # Constantes e widgets globais
│   ├── models/                  # 📊 MODELS - Entidades de dados
│   │   ├── user_model.dart
│   │   ├── cartao_model.dart
│   │   └── fatura_model.dart
│   └── modules/                 # Módulos organizados por funcionalidade
│       ├── home/                # 🏠 HOME MODULE
│       │   ├── home_page.dart           # VIEW
│       │   ├── home_controller.dart      # CONTROLLER
│       │   ├── home_bindings.dart       # DEPENDENCY INJECTION
│       │   └── widgets/                 # WIDGETS ESPECÍFICOS
│       │       ├── appbar_widget.dart
│       │       └── favoritos_widget.dart
│       ├── login/                # 🔐 LOGIN MODULE
│       │   ├── login_page.dart           # VIEW
│       │   ├── login_controller.dart     # CONTROLLER
│       │   ├── login_repository.dart     # SERVICE
│       │   └── login_bindings.dart      # DEPENDENCY INJECTION
│       ├── splash/               # 🚀 SPLASH MODULE
│       │   ├── splash_page.dart          # VIEW
│       │   ├── splash_controller.dart    # CONTROLLER
│       │   └── splash_binding.dart       # DEPENDENCY INJECTION
│       ├── cartao_bank/          # 💳 CARTÃO MODULE
│       │   ├── cartao_bank_page.dart     # VIEW
│       │   ├── cartao_bank_widget.dart   # WIDGET
│       │   ├── cartao_controller.dart    # CONTROLLER
│       │   ├── cartao_repositories.dart  # SERVICE
│       │   └── cartao_bindings.dart     # DEPENDENCY INJECTION
│       ├── fatura/               # 📄 FATURA MODULE
│       │   ├── fatura.dart              # VIEW
│       │   ├── fatura_controller.dart   # CONTROLLER
│       │   ├── fatura_repository.dart   # SERVICE
│       │   └── fatura_bindings.dart     # DEPENDENCY INJECTION
│       └── app_bar_inferior.dart/       # 🧭 NAVIGATION MODULE
│           ├── bottom_bar_main_page.dart
│           └── bottom_bar_widget.dart
├── application/                  # Configuração de módulos
│   ├── all_modules.dart
│   └── module.dart
└── main.dart                    # Entry point
```

## 🎯 Responsabilidades por Camada

### 📊 MODELS (Entidades)
- **Localização**: `lib/app/models/`
- **Responsabilidade**: Representar dados da aplicação
- **Arquivos**: `user_model.dart`, `cartao_model.dart`, `fatura_model.dart`

### 🖼️ VIEWS (Interface)
- **Localização**: `lib/app/modules/*/`
- **Responsabilidade**: Interface do usuário
- **Arquivos**: `*_page.dart`, `*_widget.dart`

### 🎮 CONTROLLERS (Lógica)
- **Localização**: `lib/app/modules/*/`
- **Responsabilidade**: Lógica de negócio e controle
- **Arquivos**: `*_controller.dart`

### 🔧 SERVICES (Repositórios)
- **Localização**: `lib/app/modules/*/` e `lib/app/core/api/`
- **Responsabilidade**: Comunicação com APIs e dados
- **Arquivos**: `*_repository.dart`, `api_client.dart`

### 🛠️ UTILS (Utilitários)
- **Localização**: `lib/app/core/`
- **Responsabilidade**: Helpers, constantes, mixins
- **Arquivos**: `constants.dart`, `loader_mixin.dart`, `app_error.dart`

## 🚀 Vantagens da Estrutura

1. **Separação Clara**: Cada camada tem responsabilidade específica
2. **Modularidade**: Funcionalidades organizadas em módulos
3. **Manutenibilidade**: Código fácil de encontrar e modificar
4. **Testabilidade**: Componentes isolados para testes
5. **Escalabilidade**: Fácil adicionar novas funcionalidades

## 📝 Como Usar

```dart
// Importar módulo específico
import 'package:gs3_tecnologia/app/modules/home/home_page.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';

// Importar models
import 'package:gs3_tecnologia/app/models/user_model.dart';

// Importar services
import 'package:gs3_tecnologia/app/core/api/api_client.dart';
```

## 🔄 Fluxo MVC

1. **VIEW** → Chama **CONTROLLER**
2. **CONTROLLER** → Usa **SERVICE** para buscar dados
3. **SERVICE** → Retorna **MODEL** para **CONTROLLER**
4. **CONTROLLER** → Atualiza **VIEW** com dados do **MODEL**
