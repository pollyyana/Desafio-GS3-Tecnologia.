import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FaturaPage extends StatefulWidget {
  const FaturaPage({super.key});

  @override
  State<FaturaPage> createState() => _FaturaPageState();
}

class _FaturaPageState extends State<FaturaPage>
    with SingleTickerProviderStateMixin {
  bool mostrarTodas = false;

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

        // Mostra 4 se estiver recolhido, todas se estiver expandido
        final faturas = mostrarTodas
            ? controller.faturas
            : controller.faturas.take(4).toList();

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho: "Últimos lançamentos" + "Ver todos"
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Últimos lançamentos',
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        mostrarTodas = !mostrarTodas;
                      });
                    },
                    child: Row(
                      children: [
                        Text(
                          mostrarTodas ? 'Ver menos' : 'Ver todos',
                          style: const TextStyle(
                            fontSize: 14,
                            color: Colors.blueAccent,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        const SizedBox(width: 4),
                        AnimatedRotation(
                          turns: mostrarTodas ? 0.5 : 0,
                          duration: const Duration(milliseconds: 300),
                          child: Image.asset(
                            ImageConstants.arrowRight,
                            width: 14,
                            height: 14,
                            color: Colors.blueAccent,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),

            // Lista animada
            AnimatedSize(
              duration: const Duration(milliseconds: 400),
              curve: Curves.easeInOut,
              child: ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: faturas.length,
                itemBuilder: (context, index) {
                  final fatura = faturas[index];
                  final iconPath = _getIconForTransaction(fatura.title);

                  return Container(
                    width: double.infinity,
                    height: 70,
                    margin: const EdgeInsets.only(
                      bottom: 10,
                      left: 8,
                      right: 8,
                    ),
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(14),
                      border: Border.all(color: Colors.grey.shade200, width: 1),
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
                        // Ícone + título + data
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

                        // Valor e parcelas
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
                },
              ),
            ),
          ],
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
