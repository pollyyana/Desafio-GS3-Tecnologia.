import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/theme/todo_list_ui_config.dart';
import 'package:gs3_tecnologia/app/database/sqlite_adm_connection.dart';
import 'package:gs3_tecnologia/app/modules/home/home_modulo.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_module.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_module.dart';
import 'package:gs3_tecnologia/app/modules/login/auth_module.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> with WidgetsBindingObserver {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(sqliteAdmConnection);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final authModule = AuthModule();
    final homeModule = HomeModule();
    final cartaoModule = CartaoModule();
    final faturaModule = FaturaModule();

    return MultiProvider(
      providers: [
        ...authModule.providers,
        ...homeModule.bindings,
        ...cartaoModule.bindings,
        ...faturaModule.bindings,
      ],
      child: MaterialApp(
        title: 'GS3 Tecnologia',
        debugShowCheckedModeBanner: false,
        theme: TodoListUiConfig.theme,
        // initialRoute: '/home',
        routes: {
          ...authModule.routers,
          ...homeModule.routers,
          ...cartaoModule.routers,
          ...faturaModule.routers,
        },
        home: const SplashPage(),
      ),
    );
  }
}
