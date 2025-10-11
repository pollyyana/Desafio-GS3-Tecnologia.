import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/modules/login/auth_module.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'gs3',
      initialRoute: '/login',
      routes: {
        ...AuthModule().routers,
      },
      home: SplashPage(),
    );
  }
}
