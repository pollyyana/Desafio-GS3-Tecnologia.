import 'package:flutter/material.dart';

import 'bottom_bar_widget.dart';

class BottomBarMainPage extends StatelessWidget {
  final BottomBarPage selectedPage;

  const BottomBarMainPage({super.key, required this.selectedPage});

  String get _pageTitle {
    switch (selectedPage) {
      case BottomBarPage.home:
        return 'Página Inicial';
      case BottomBarPage.fatura:
        return 'Fatura';
      case BottomBarPage.cartao:
        return 'Cartão';
      case BottomBarPage.shop:
        return 'Shop';
    }
  }

  IconData get _pageIcon {
    switch (selectedPage) {
      case BottomBarPage.home:
        return Icons.home;
      case BottomBarPage.fatura:
        return Icons.receipt_long;
      case BottomBarPage.cartao:
        return Icons.credit_card;
      case BottomBarPage.shop:
        return Icons.shopping_bag;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(_pageTitle)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(_pageIcon, size: 80, color: const Color(0xFF2B66BC)),
            const SizedBox(height: 16),
            Text(
              _pageTitle,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
