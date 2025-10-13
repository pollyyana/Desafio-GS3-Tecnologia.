import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/api/api_client.dart';
import 'package:gs3_tecnologia/application/all_modules.dart';
import 'package:intl/date_symbol_data_local.dart'; // ✅ Import necessário

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDateFormatting('pt_BR', null);

  await ApiClient.instance.init();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'GS3 Tecnologia',
      theme: ThemeData(),
      debugShowCheckedModeBanner: false,
      // initialRoute: '/home',
      getPages: [
        ...AllModules().routers,
      ],
    );
  }
}
