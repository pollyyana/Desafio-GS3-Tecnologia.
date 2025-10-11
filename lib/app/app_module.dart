import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/app_widget.dart';
import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/modules/login/login_repository.dart';
import 'package:gs3_tecnologia/app/modules/login/login_repository_impl.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        // Fornecendo o SqliteConnectionFactory para o banco de dados local
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false, // Cria o banco e faz a configuração na inicialização
        ),

        // Fornecendo o LoginRepository para acessar os dados dos usuários no banco
        Provider<LoginRepository>(
          create: (context) => LoginRepositoryImpl(
            context
                .read<
                  SqliteConnectionFactory
                >(), // Usando a conexão com o banco
          ),
        ),

        // // Fornecendo o UserService para a lógica de login
        // Provider<UserService>(
        //   create: (context) => UserServiceImpl(
        //     userRepository: context.read<LoginRepository>(), // Usando o repositório de login
        //   ),
        // ),
      ],
      child:
          const AppWidget(), // Inicia o AppWidget com todos os providers injetados
    );
  }
}
