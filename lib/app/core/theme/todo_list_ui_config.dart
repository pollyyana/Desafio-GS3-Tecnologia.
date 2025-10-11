import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TodoListUiConfig {
  TodoListUiConfig._();

  static ThemeData get theme => ThemeData(
    primaryColor: Color(0xFF013972), // Azul escuro
    primaryColorLight: Color(0xFF4A90E2), // Azul claro (secundário)
    scaffoldBackgroundColor: Colors.white,
    textTheme: GoogleFonts.mulishTextTheme(),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        backgroundColor: Color(0xFF013972),
      ),
    ),
  );

  static TextTheme get textThemeMulish => GoogleFonts.mulishTextTheme();
  static TextTheme get textThemeManrope => GoogleFonts.manropeTextTheme();
}

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

//colinha
// Text(
//   'Olá, Cliente',
//   style: context.mulishBold.copyWith(
//     fontSize: 20,
//     color: AppColors.primary,
//   ),
// ),

// Container(
//   decoration: BoxDecoration(
//     color: AppColors.secondary,
//     borderRadius: BorderRadius.circular(16),
//   ),
//   child: Padding(
//     padding: const EdgeInsets.all(16.0),
//     child: Text(
//       'R\$ 7.867,80',
//       style: context.manropeMedium.copyWith(
//         fontSize: 18,
//         color: Colors.white,
//       ),
//     ),
//   ),
// )
