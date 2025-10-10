import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/app_widget.dart';
import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:provider/provider.dart';

class AppModule extends StatelessWidget {
  const AppModule({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        Provider(
          create: (_) => SqliteConnectionFactory(),
          lazy: false,
        ),
      ],
      child: AppWidget(),
    );
  }
}
