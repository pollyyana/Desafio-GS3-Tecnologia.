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
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Primeira data
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Text(
                    dataFixaHoje,
                    style: GoogleFonts.mulish(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                      color: const Color(0xFF2B66BC),
                    ),
                  ),
                ),

                // Lista de faturas
                ...List.generate(faturas.length, (index) {
                  final fatura = faturas[index];
                  final iconPath = _getIconForTransaction(fatura.title);

                  // Insere nova data após o segundo item
                  if (index == 2) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Divider(
                          height: 20,
                          thickness: 0.8,
                          color: Color(0xFFE0E0E0),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom: 15, top: 4),
                          child: Text(
                            dataFixaAnterior,
                            style: GoogleFonts.mulish(
                              fontSize: 15,
                              fontWeight: FontWeight.w700,
                              color: const Color(0xFF2B66BC),
                            ),
                          ),
                        ),
                        const Divider(
                          height: 16,
                          thickness: 0.6,
                          color: Color(0xFFE0E0E0),
                        ),
                        _buildListItem(fatura, iconPath, currency),
                      ],
                    );
                  }

                  return Column(
                    children: [
                      if (index != 0)
                        const Divider(
                          height: 18,
                          thickness: 0.6,
                          color: Color(0xFFE0E0E0),
                        ),
                      _buildListItem(fatura, iconPath, currency),
                    ],
                  );
                }),
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
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Lado esquerdo
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(iconPath, width: 38, height: 38),
              const SizedBox(width: 14),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    fatura.title,
                    style: GoogleFonts.mulish(
                      fontSize: 14.5,
                      fontWeight: FontWeight.w700,
                      color: Colors.black87,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    DateFormat("dd/MM 'às' HH:mm", 'pt_BR').format(fatura.date),
                    style: GoogleFonts.mulish(
                      fontSize: 12.8,
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
                  fontSize: 14.5,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              if (fatura.parcelas.toString().isNotEmpty)
                Padding(
                  padding: const EdgeInsets.only(top: 3),
                  child: Text(
                    'em ${fatura.parcelas}x',
                    style: GoogleFonts.mulish(
                      fontSize: 12.5,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey.shade500,
                    ),
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
