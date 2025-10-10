// import 'package:flutter/material.dart';
// import 'package:gs3_tecnologia/app/core/widgets/constants.dart';

// Widget _favoritoItem(
//   String? imagePath,
//   String label, {
//   IconData? icon,
//   bool useContainer = false,
//   double containerSize = 100,
// }) {
//   // Define o widget do ícone/imagem
//   Widget iconWidget;

//   if (imagePath != null) {
//     // Caso seja imagem do assets
//     iconWidget = Image.asset(
//       imagePath,
//       width: 66,
//       height: 66,
//       fit: BoxFit.contain,
//     );
//   } else if (icon != null) {
//     // Caso seja ícone do Flutter
//     iconWidget = ShaderMask(
//       shaderCallback: (bounds) => LinearGradient(
//         colors: [
//           ColorsConstants.azulGradient,
//           ColorsConstants.azulGradient.withOpacity(0.7), // Corrigido
//         ],
//         begin: Alignment.topLeft,
//         end: Alignment.bottomRight,
//       ).createShader(bounds),
//       child: Icon(icon, size: 40, color: Colors.white),
//     );
//   } else {
//     // Caso nenhum seja informado
//     iconWidget = const SizedBox.shrink();
//   }

//   // Envolve em container se necessário
//   if (useContainer) {
//     iconWidget = Container(
//       height: containerSize,
//       width: containerSize,
//       decoration: BoxDecoration(
//         color: ColorsConstants.gray,
//         borderRadius: BorderRadius.circular(16),
//       ),
//       child: Center(child: iconWidget),
//     );
//   }

//   // Retorna o item completo com label
//   return Column(
//     mainAxisAlignment: MainAxisAlignment.center,
//     children: [
//       iconWidget,
//       const SizedBox(height: 8),
//       Text(
//         label,
//         style: const TextStyle(
//           fontSize: 12,
//           color: Colors.black87,
//           fontWeight: FontWeight.w400,
//         ),
//       ),
//     ],
//   );
// }
