import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
              style: GoogleFonts.mulish(
                color: Colors.red,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }

        if (controller.faturas.isEmpty) {
          return Center(
            child: Text(
              'Nenhum lançamento encontrado\nSelecione um cartão',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                color: Colors.grey,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        }

        // Datas fixas
        const dataFixaHoje = 'Hoje, 05 Set';
        const dataFixaAnterior = '03 Set';

        final faturas = controller.faturas;

        return SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Cabeçalho inicial - Hoje
              Text(
                dataFixaHoje,
                style: GoogleFonts.mulish(
                  fontSize: 15,
                  fontWeight: FontWeight.w700,
                  color: const Color(0xFF2B66BC),
                ),
              ),
              const SizedBox(height: 10),

              // Lista de faturas
              ...List.generate(faturas.length, (index) {
                final fatura = faturas[index];
                final iconPath = _getIconForTransaction(fatura.title);

                // Card da fatura
                final card = Container(
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
                      // Lado esquerdo
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
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w700,
                                  color: Colors.black87,
                                ),
                              ),
                              const SizedBox(height: 4),
                              Text(
                                DateFormat(
                                  'dd/MM • HH:mm',
                                  'pt_BR',
                                ).format(fatura.date),
                                style: GoogleFonts.mulish(
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),

                      // Lado direito
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            currency.format(fatura.amount),
                            style: GoogleFonts.mulish(
                              fontSize: 12,
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          if (fatura.parcelas.toString().isNotEmpty)
                            Text(
                              'em ${fatura.parcelas}',
                              style: GoogleFonts.mulish(
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey.shade500,
                              ),
                            ),
                        ],
                      ),
                    ],
                  ),
                );

                // Insere data “03 Set” após o segundo card
                if (index == 1) {
                  return Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      card,
                      const SizedBox(height: 10),
                      Text(
                        dataFixaAnterior,
                        style: GoogleFonts.mulish(
                          fontSize: 15,
                          fontWeight: FontWeight.w700,
                          color: const Color(0xFF2B66BC),
                        ),
                      ),
                      const SizedBox(height: 10),
                    ],
                  );
                }

                return card;
              }),
            ],
          ),
        );
      },
    );
  }

  // Ícones das transações
  String _getIconForTransaction(String title) {
    final lower = title.toLowerCase();
    if (lower.contains('uber')) return ImageConstants.uber;
    if (lower.contains('apple')) return ImageConstants.mobile;
    if (lower.contains('carrefour')) return ImageConstants.mercado;
    if (lower.contains('conta vivo')) return ImageConstants.mobile;
    return ImageConstants.shope;
  }
}
