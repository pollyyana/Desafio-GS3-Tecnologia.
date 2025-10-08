import 'package:flutter/material.dart';

class FavoritosWidget extends StatelessWidget {
  const FavoritosWidget({super.key});

  @override
  Widget build(BuildContext context) {
    //adiconar assets
    final items = [
      {'icon': Icons.credit_card, 'label': 'Cartão virtual'},
      {'icon': Icons.add_card, 'label': 'Cartão adicional'},
      {'icon': Icons.security, 'label': 'Seguros'},
      {'icon': Icons.card_giftcard, 'label': 'Pacotes'},
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Meus favoritos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Personalizar',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: items
              .map(
                (item) => Column(
                  children: [
                    CircleAvatar(
                      radius: 28,
                      backgroundColor: Colors.grey.shade100,
                      child: Icon(
                        item['icon'] as IconData,
                        color: Colors.blue,
                        size: 28,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      item['label'] as String,
                      style: const TextStyle(fontSize: 12),
                    ),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
