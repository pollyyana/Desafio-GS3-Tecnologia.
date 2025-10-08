import 'package:flutter/material.dart';

class FaturaWidget extends StatelessWidget {
  const FaturaWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final transactions = [
      {
        'date': 'Hoje, 05 Set',
        'items': [
          {'title': 'Apple', 'value': 'R\$545,99'},
          {'title': 'Uber*Uber*Trip', 'value': 'R\$12,96'},
        ],
      },
      {
        'date': '03 Set',
        'items': [
          {'title': 'Carrefour', 'value': 'R\$349,76'},
        ],
      },
    ];

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: const [
            Text(
              'Últimos lançamentos',
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            Text(
              'Ver todos',
              style: TextStyle(color: Colors.blue),
            ),
          ],
        ),
        const SizedBox(height: 16),
        Column(
          children: transactions
              .map(
                (group) => Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      group['date'] as String,
                      style: const TextStyle(
                        fontSize: 14,
                        color: Colors.grey,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...((group['items'] as List).map(
                      (item) => Container(
                        margin: const EdgeInsets.only(bottom: 8),
                        padding: const EdgeInsets.symmetric(
                          horizontal: 12,
                          vertical: 12,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(item['title'] as String),
                            Text(
                              item['value'] as String,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                color: Colors.black87,
                              ),
                            ),
                          ],
                        ),
                      ),
                    )),
                  ],
                ),
              )
              .toList(),
        ),
      ],
    );
  }
}
