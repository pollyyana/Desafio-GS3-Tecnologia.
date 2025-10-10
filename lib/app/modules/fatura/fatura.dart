import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_controller.dart';
import 'package:intl/intl.dart';

class Fatura extends StatelessWidget {
  const Fatura({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<FaturaController>();
    final currency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Obx(() {
      final faturas = controller.faturas;

      if (faturas.isEmpty) {
        return const Center(
          child: Text(
            'Nenhum lançamento encontrado',
            style: TextStyle(color: Colors.grey),
          ),
        );
      }

      // 🔹 Agrupa faturas por dia
      final Map<String, List> grouped = {};
      for (var f in faturas) {
        final dateKey = DateFormat('dd MMM', 'pt_BR').format(f.date);
        grouped.putIfAbsent(dateKey, () => []).add(f);
      }

      final keys = grouped.keys.toList();

      return Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // 🔹 Cabeçalho
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: const [
                Text(
                  'Últimos lançamentos',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Ver todos',
                  style: TextStyle(
                    color: Color(0xFF2B66BC),
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 12),

          // 🔹 Grupos por data
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: keys.map((key) {
              final transacoes = grouped[key]!;

              // título de data ("Hoje, 05 Set" se for a data atual)
              final DateTime firstDate = transacoes.first.date;
              final bool isToday =
                  DateFormat('dd/MM').format(firstDate) ==
                  DateFormat('dd/MM').format(DateTime.now());

              final String tituloData = isToday
                  ? 'Hoje, ${DateFormat('dd MMM', 'pt_BR').format(firstDate)}'
                  : key;

              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 8.0,
                      vertical: 6,
                    ),
                    child: Text(
                      tituloData,
                      style: const TextStyle(
                        fontSize: 15,
                        color: Color(0xFF2B66BC),
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  ...transacoes.map((f) {
                    final iconPath = _getIconForTransaction(f.title);

                    return Container(
                      width: double.infinity,
                      height: 70,
                      margin: const EdgeInsets.only(bottom: 10),
                      padding: const EdgeInsets.symmetric(horizontal: 16),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(14),
                        border: Border.all(
                          color: Colors.grey.shade200,
                          width: 1,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.06),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Image.asset(
                                iconPath,
                                width: 38,
                                height: 38,
                              ),
                              const SizedBox(width: 14),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    f.title,
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    DateFormat(
                                      'dd/MM • HH:mm',
                                      'pt_BR',
                                    ).format(f.date),
                                    style: const TextStyle(
                                      fontSize: 12,
                                      color: Colors.grey,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),

                          // Valor
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                currency.format(f.amount),
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                'em 3x',
                                style: TextStyle(
                                  fontSize: 12,
                                  color: Colors.grey.shade500,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }),
                ],
              );
            }).toList(),
          ),
        ],
      );
    });
  }

  String _getIconForTransaction(String title) {
    if (title.toLowerCase().contains('uber')) return ImageConstants.uber;
    if (title.toLowerCase().contains('apple')) return ImageConstants.mobile;
    if (title.toLowerCase().contains('carrefour'))
      return ImageConstants.mercado;

    return ImageConstants.shope;
  }
}
