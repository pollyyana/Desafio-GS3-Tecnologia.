import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';

class BottomBarWidget extends StatefulWidget {
  const BottomBarWidget({super.key});

  @override
  State<BottomBarWidget> createState() => _BottomBarWidgetState();
}

class _BottomBarWidgetState extends State<BottomBarWidget> {
  int? _selectedIndex;

  final _items = [
    _BottomItem(label: 'Home', icon: ImageConstants.home),
    _BottomItem(label: 'Fatura', icon: ImageConstants.fatura),
    _BottomItem(label: 'Cartão', icon: ImageConstants.cartao),
    _BottomItem(label: 'Shop', icon: ImageConstants.shope),
  ];

  void _onTap(int index) {
    setState(() {
      // Se clicar de novo → fecha
      _selectedIndex = (_selectedIndex == index) ? null : index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        // --- Página branca sobreposta (mas Home continua visível por baixo) ---
        if (_selectedIndex != null)
          Positioned.fill(
            child: GestureDetector(
              onTap: () => setState(() => _selectedIndex = null),
              child: Container(
                color: Colors.white.withOpacity(0.96),
                child: Center(
                  child: _EmptyPage(index: _selectedIndex!),
                ),
              ),
            ),
          ),

        // --- Barra inferior ---
        Align(
          alignment: Alignment.bottomCenter,
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 28),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withOpacity(0.1),
                  blurRadius: 10,
                  offset: const Offset(0, -2),
                ),
              ],
            ),
            child: SafeArea(
              top: false,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: List.generate(_items.length, (index) {
                  final item = _items[index];
                  final selected = index == _selectedIndex;

                  return GestureDetector(
                    onTap: () => _onTap(index),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Image.asset(
                          item.icon,
                          width: 26,
                          height: 26,
                          color: selected
                              ? const Color(0xFF2B66BC)
                              : Colors.grey,
                        ),
                        const SizedBox(height: 4),
                        Text(
                          item.label,
                          style: TextStyle(
                            color: selected
                                ? const Color(0xFF2B66BC)
                                : Colors.grey.shade600,
                            fontWeight: selected
                                ? FontWeight.bold
                                : FontWeight.w400,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

/// --- Página simples “vazia” ---
class _EmptyPage extends StatelessWidget {
  final int index;

  const _EmptyPage({required this.index});

  @override
  Widget build(BuildContext context) {
    const titles = ['Home', 'Fatura', 'Cartão', 'Shop'];
    const icons = [
      Icons.home,
      Icons.receipt_long,
      Icons.credit_card,
      Icons.shopping_bag,
    ];

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icons[index], size: 80, color: const Color(0xFF2B66BC)),
        const SizedBox(height: 16),
        Text(
          'Página ${titles[index]}',
          style: const TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Color(0xFF2B66BC),
          ),
        ),
        const SizedBox(height: 8),
        const Text(
          'Clique novamente para fechar',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }
}

class _BottomItem {
  final String label;
  final String icon;
  _BottomItem({required this.label, required this.icon});
}
