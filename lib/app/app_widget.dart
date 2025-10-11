import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/database/sqlite_adm_connection.dart';
import 'package:gs3_tecnologia/app/modules/login/auth_module.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';
import 'package:provider/provider.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({super.key});

  @override
  State<AppWidget> createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  final sqliteAdmConnection = SqliteAdmConnection();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(sqliteAdmConnection);
  }

  @override
  Widget build(BuildContext context) {
    final authModule = AuthModule();

    return MultiProvider(
      providers: authModule.providers,
      child: MaterialApp(
        title: 'gs3',
        routes: {
          ...authModule.routers,
        },
        home: const SplashPage(),
      ),
    );
  }
}
