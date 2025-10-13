// import 'package:flutter/material.dart';

// class TransactionItem extends StatelessWidget {
//   final String title;
//   final String date;
//   final String amount;
//   final String iconPath;

//   const TransactionItem({
//     super.key,
//     required this.title,
//     required this.date,
//     required this.amount,
//     required this.iconPath,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//         children: [
//           // 🔹 Ícone + texto
//           Row(
//             children: [
//               Image.asset(
//                 iconPath,
//                 width: 36,
//                 height: 36,
//               ),
//               const SizedBox(width: 12),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                       fontSize: 16,
//                       fontWeight: FontWeight.w600,
//                       color: Colors.black,
//                     ),
//                   ),
//                   const SizedBox(height: 4),
//                   Text(
//                     date,
//                     style: const TextStyle(
//                       fontSize: 13,
//                       color: Color(0xFF9E9E9E),
//                     ),
//                   ),
//                 ],
//               ),
//             ],
//           ),

//           // 🔹 Valor + parcelas
//           Column(
//             crossAxisAlignment: CrossAxisAlignment.end,
//             children: [
//               Text(
//                 amount,
//                 style: const TextStyle(
//                   fontSize: 16,
//                   fontWeight: FontWeight.bold,
//                   color: Colors.black,
//                 ),
//               ),
//               const SizedBox(height: 3),
//               const Text(
//                 'em 1x',
//                 style: TextStyle(
//                   fontSize: 13,
//                   color: Color(0xFF9E9E9E),
//                 ),
//               ),
//             ],
//           ),
//         ],
//       ),
//     );
//   }
// }
