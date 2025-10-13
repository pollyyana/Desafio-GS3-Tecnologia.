// import 'package:flutter/material.dart';

// import 'bottom_bar_widget.dart';

// /// Enum que representa as páginas
// enum BottomPageType { home, fatura, cartao, shop }

// /// Página simples de placeholder para cada botão
// class BottomBarPage extends StatelessWidget {
//   final BottomPageType selectedPage;

//   const BottomBarPage({super.key, required this.selectedPage});

//   String get _pageTitle {
//     switch (selectedPage) {
//       case BottomPageType.home:
//         return 'Página Inicial';
//       case BottomPageType.fatura:
//         return 'Fatura';
//       case BottomPageType.cartao:
//         return 'Cartão';
//       case BottomPageType.shop:
//         return 'Shop';
//     }
//   }

//   IconData get _pageIcon {
//     switch (selectedPage) {
//       case BottomPageType.home:
//         return Icons.home;
//       case BottomPageType.fatura:
//         return Icons.receipt_long;
//       case BottomPageType.cartao:
//         return Icons.credit_card;
//       case BottomPageType.shop:
//         return Icons.shopping_bag;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text(_pageTitle)),
//       body: Center(
//         child: Column(
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             Icon(_pageIcon, size: 80, color: const Color(0xFF2B66BC)),
//             const SizedBox(height: 16),
//             Text(
//               _pageTitle,
//               style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
//             ),
//           ],
//         ),
//       ),
//       bottomNavigationBar: BottomBarWidget(
//         currentIndex: null,
//         onItemSelected: (_) {},
//       ),
//     );
//   }
// }
