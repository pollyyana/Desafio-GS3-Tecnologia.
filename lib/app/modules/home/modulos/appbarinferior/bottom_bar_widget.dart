// import 'package:flutter/material.dart';
// import 'package:gs3_tecnologia/app/core/utils/constants.dart';
// import 'package:gs3_tecnologia/app/core/widgets/constants.dart';
// import 'package:gs3_tecnologia/app/modules/app_bar_inferior.dart/bottom_bar_main_page.dart';

// enum BottomBarPage { home, fatura, cartao, shop }

// class BottomBarWidget extends StatefulWidget {
//   const BottomBarWidget({super.key});

//   @override
//   State<BottomBarWidget> createState() => _BottomBarWidgetState();
// }

// class _BottomBarWidgetState extends State<BottomBarWidget> {
//   final ValueNotifier<BottomBarPage> selectedPage = ValueNotifier(
//     BottomBarPage.home,
//   );

//   final List<_BottomItem> items = [
//     _BottomItem(
//       label: 'Home',
//       icon: ImageConstants.home,
//       page: BottomBarPage.home,
//     ),
//     _BottomItem(
//       label: 'Fatura',
//       icon: ImageConstants.fatura,
//       page: BottomBarPage.fatura,
//     ),
//     _BottomItem(
//       label: 'Cartão',
//       icon: ImageConstants.cartao,
//       page: BottomBarPage.cartao,
//     ),
//     _BottomItem(
//       label: 'Shop',
//       icon: ImageConstants.shope,
//       page: BottomBarPage.shop,
//     ),
//   ];

//   @override
//   void dispose() {
//     selectedPage.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return ValueListenableBuilder<BottomBarPage>(
//       valueListenable: selectedPage,
//       builder: (context, page, _) {
//         return Container(
//           width: double.infinity,
//           padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 32),
//           decoration: BoxDecoration(
//             color: Colors.white,
//             borderRadius: const BorderRadius.only(
//               topLeft: Radius.circular(30),
//               topRight: Radius.circular(30),
//             ),
//             boxShadow: [
//               BoxShadow(
//                 color: Colors.black.withOpacity(0.1),
//                 blurRadius: 10,
//                 offset: const Offset(0, -2),
//               ),
//             ],
//           ),
//           child: SafeArea(
//             top: false,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               children: items.map((item) {
//                 final selected = page == item.page;

//                 return GestureDetector(
//                   onTap: () {
//                     selectedPage.value = item.page;
//                     Navigator.push(
//                       context,
//                       PageRouteBuilder(
//                         pageBuilder: (_, __, ___) =>
//                             BottomBarPage(selectedPage: selectedPage.value),
//                         transitionsBuilder: (_, animation, __, child) =>
//                             FadeTransition(
//                               opacity: animation,
//                               child: child,
//                             ),
//                       ),
//                     );
//                   },
//                   child: Column(
//                     mainAxisSize: MainAxisSize.min,
//                     children: [
//                       Image.asset(
//                         item.icon,
//                         width: 26,
//                         height: 26,
//                         color: selected ? const Color(0xFF2B66BC) : Colors.grey,
//                       ),
//                       const SizedBox(height: 4),
//                       Text(
//                         item.label,
//                         style: TextStyle(
//                           color: selected
//                               ? const Color(0xFF2B66BC)
//                               : Colors.grey.shade600,
//                           fontWeight: selected
//                               ? FontWeight.bold
//                               : FontWeight.w400,
//                           fontSize: 12,
//                         ),
//                       ),
//                     ],
//                   ),
//                 );
//               }).toList(),
//             ),
//           ),
//         );
//       },
//     );
//   }
// }

// class _BottomItem {
//   final String label;
//   final String icon;
//   final BottomBarPage page;

//   _BottomItem({required this.label, required this.icon, required this.page});
// }
