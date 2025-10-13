import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
    useMaterial3: false,
    primaryColor: AppColors.primary,
    primaryColorLight: AppColors.secondary,
    scaffoldBackgroundColor: AppColors.background,
    textTheme: GoogleFonts.mulishTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        textStyle: GoogleFonts.mulish(
          fontWeight: FontWeight.w600,
          fontSize: 16,
        ),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    ),
    appBarTheme: AppBarTheme(
      backgroundColor: AppColors.primary,
      foregroundColor: Colors.white,
      elevation: 0,
      titleTextStyle: GoogleFonts.mulish(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 18,
      ),
    ),
  );

  static TextTheme get textThemeMulish => GoogleFonts.mulishTextTheme();
  static TextTheme get textThemeManrope => GoogleFonts.manropeTextTheme();
}

class AppColors {
  static const primary = Color(0xFF013972); // Azul escuro
  static const secondary = Color(0xFF4A90E2); // Azul claro
  static const cardGreen = Color(0xFF2E8B57); // Verde do segundo cartão
  static const background = Colors.white; // Fundo
  static const textGrey = Color(0xFF666666); // Texto cinza
  static const Color borderGrey = Color(0xFFBDBDBD); // borda inativa
}

/// ✍️ Extensões para usar fontes facilmente no contexto do app
extension TextStyleExtension on BuildContext {
  // Mulish
  TextStyle get mulishBold => GoogleFonts.mulish(fontWeight: FontWeight.bold);
  TextStyle get mulishRegular =>
      GoogleFonts.mulish(fontWeight: FontWeight.normal);
  TextStyle get mulishMedium => GoogleFonts.mulish(fontWeight: FontWeight.w500);

  // Manrope
  TextStyle get manropeBold => GoogleFonts.manrope(fontWeight: FontWeight.bold);
  TextStyle get manropeRegular =>
      GoogleFonts.manrope(fontWeight: FontWeight.normal);
  TextStyle get manropeMedium =>
      GoogleFonts.manrope(fontWeight: FontWeight.w500);
}
