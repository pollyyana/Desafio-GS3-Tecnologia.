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

        // Datas fixas de exemplo
        const dataFixaHoje = 'Hoje, 05 Set';
        const dataFixaAnterior = '03 Set';

        final faturas = controller.faturas;

        return Container(
          color: Colors.white,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Cabeçalho principal
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          // Primeira data
                          Padding(
                            padding: const EdgeInsets.fromLTRB(0, 0, 0, 8),
                            child: Text(
                              dataFixaHoje,
                              style: GoogleFonts.mulish(
                                fontSize: 15,
                                fontWeight: FontWeight.w700,
                                color: const Color(0xFF2B66BC),
                              ),
                            ),
                          ),

                          // Itens da lista
                          ...List.generate(faturas.length, (index) {
                            final fatura = faturas[index];
                            final iconPath = _getIconForTransaction(
                              fatura.title,
                            );

                            if (index == 2) {
                              return Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Divider(
                                    color: Colors.grey.shade200,
                                    height: 1,
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(
                                      0,
                                      16,
                                      0,
                                      8,
                                    ),
                                    child: Text(
                                      dataFixaAnterior,
                                      style: GoogleFonts.mulish(
                                        fontSize: 15,
                                        fontWeight: FontWeight.w700,
                                        color: const Color(0xFF2B66BC),
                                      ),
                                    ),
                                  ),
                                  Divider(
                                    color: Colors.grey.shade200,
                                    height: 1,
                                  ),
                                  _buildListItem(
                                    fatura,
                                    iconPath,
                                    currency,
                                    context,
                                  ),
                                ],
                              );
                            }

                            return Column(
                              children: [
                                if (index != 0)
                                  Divider(
                                    color: Colors.grey.shade200,
                                    height: 1,
                                  ),
                                _buildListItem(
                                  fatura,
                                  iconPath,
                                  currency,
                                  context,
                                ),
                              ],
                            );
                          }),
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildListItem(
    dynamic fatura,
    String iconPath,
    NumberFormat currency,
    BuildContext context,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
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
                children: [
                  Text(
                    fatura.title,
                    style: GoogleFonts.mulish(
                      fontSize: 14,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    DateFormat("dd/MM 'às' HH:mm", 'pt_BR').format(fatura.date),
                    style: GoogleFonts.mulish(
                      fontSize: 13,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ],
          ),

          // Lado direito
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                currency.format(fatura.amount),
                style: GoogleFonts.mulish(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (fatura.parcelas.toString().isNotEmpty)
                Text(
                  'em ${fatura.parcelas}x',
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
