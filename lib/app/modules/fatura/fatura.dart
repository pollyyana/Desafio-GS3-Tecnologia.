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

    // Detecta se existe um Scrollable acima (ex.: SingleChildScrollView da Home)
    final hasParentScrollable = Scrollable.of(context) != null;

    // Se houver pai com scroll, não deixamos esse ListView rolar.
    // Caso contrário (widget usado sozinho), deixamos rolar normalmente.
    final physics = hasParentScrollable
        ? const NeverScrollableScrollPhysics()
        : const BouncingScrollPhysics();
    final shrinkWrap = hasParentScrollable ? true : false;

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

      // Agrupa faturas por data
      final Map<String, List> grouped = {};
      for (var f in faturas) {
        final dateKey = DateFormat('dd MMM', 'pt_BR').format(f.date);
        grouped.putIfAbsent(dateKey, () => []).add(f);
      }

      final keys = grouped.keys.toList();

      return ListView.builder(
        padding: const EdgeInsets.only(bottom: 30),
        physics: physics,
        shrinkWrap: shrinkWrap,
        itemCount: keys.length,
        itemBuilder: (context, i) {
          final key = keys[i];
          final transacoes = grouped[key]!;

          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho da data (ex: “05 set.”) — mostra "Hoje, dd MMM" se for hoje
              Padding(
                padding: const EdgeInsets.fromLTRB(16, 8, 16, 4),
                child: Text(
                  _formatDateHeader(transacoes.first.date),
                  style: const TextStyle(
                    fontSize: 15,
                    color: Color(0xFF2B66BC),
                    fontWeight: FontWeight.w700,
                  ),
                ),
              ),
              ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: transacoes.length,
                itemBuilder: (context, index) {
                  final f = transacoes[index];
                  final iconPath = _getIconForTransaction(f.title);

                  return Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 10,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        // ícone + textos
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
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  DateFormat(
                                    "dd/MM 'às' HH:mm",
                                    'pt_BR',
                                  ).format(f.date),
                                  style: const TextStyle(
                                    fontSize: 13,
                                    color: Color(0xFF9E9E9E),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        // valor e parcelas
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              currency.format(f.amount),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                                color: Colors.black,
                              ),
                            ),
                            const SizedBox(height: 3),
                            const Text(
                              'em 1x',
                              style: TextStyle(
                                fontSize: 13,
                                color: Color(0xFF9E9E9E),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  );
                },

                // Divider
                separatorBuilder: (_, __) => const Divider(
                  height: 1,
                  thickness: 0.6,
                  endIndent: 19,
                  color: Color(0xFFE0E0E0),
                ),
              ),

              // Divider
              if (i < keys.length - 1)
                const Padding(
                  padding: EdgeInsets.only(top: 4),
                  child: Divider(
                    height: 1,
                    thickness: 0.8,
                    endIndent: 19,
                    color: Color(0xFFE0E0E0),
                  ),
                ),
            ],
          );
        },
      );
    });
  }

  String _formatDateHeader(DateTime date) {
    final dateFmt = DateFormat('dd MMM', 'pt_BR').format(date);
    if (DateFormat('dd/MM').format(date) ==
        DateFormat('dd/MM').format(DateTime.now())) {
      return 'Hoje, $dateFmt';
    }
    return dateFmt;
  }

  String _getIconForTransaction(String title) {
    if (title.toLowerCase().contains('uber')) return ImageConstants.uber;
    if (title.toLowerCase().contains('apple')) return ImageConstants.mobile;
    if (title.toLowerCase().contains('carrefour'))
      return ImageConstants.mercado;
    return ImageConstants.shope;
  }
}
