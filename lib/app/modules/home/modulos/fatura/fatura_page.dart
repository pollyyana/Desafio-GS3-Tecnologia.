import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FaturaPage extends StatelessWidget {
  const FaturaPage({super.key});

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Consumer<FaturaController>(
      builder: (context, controller, _) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.errorMessage != null) {
          return Center(
            child: Text(
              controller.errorMessage!,
              style: const TextStyle(color: Colors.red),
            ),
          );
        }

        if (controller.faturas.isEmpty) {
          return const Center(
            child: Text(
              'Nenhum lançamento encontrado\nSelecione um cartão',
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.grey),
            ),
          );
        }

        const dataFixa = 'Hoje, 05 Set';
        final faturas = controller.faturas;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                dataFixa,
                style: TextStyle(
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF2B66BC),
                ),
              ),
              const SizedBox(height: 10),

              Column(
                children: List.generate(faturas.length, (index) {
                  final fatura = faturas[index];
                  final iconPath = _getIconForTransaction(fatura.title);

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
                            Image.asset(iconPath, width: 38, height: 38),
                            const SizedBox(width: 14),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  fatura.title,
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
                                  ).format(fatura.date),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    color: Colors.grey,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              currency.format(fatura.amount),
                              style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            if (fatura.parcelas.toString().isNotEmpty)
                              Text(
                                'em ${fatura.parcelas}',
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
              ),
            ],
          ),
        );
      },
    );
  }

  String _getIconForTransaction(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('uber')) return ImageConstants.uber;
    if (lower.contains('apple')) return ImageConstants.mobile;
    if (lower.contains('carrefour')) return ImageConstants.mercado;
    if (lower.contains('conta vivo')) return ImageConstants.mobile;
    return ImageConstants.shope;
  }
}
