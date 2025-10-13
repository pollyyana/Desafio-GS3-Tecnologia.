import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/app_module.dart';
import 'package:intl/date_symbol_data_local.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Inicializar localização para português brasileiro

  await initializeDateFormatting('pt_BR', null);
  runApp(const AppModule());
}
