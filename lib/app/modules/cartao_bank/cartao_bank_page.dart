// lib/app/modules/cartao_bank/cartao_bank_page.dart
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_bank_widget.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_controller.dart';
import 'package:intl/intl.dart';

class CartaoBankPage extends StatefulWidget {
  const CartaoBankPage({super.key});

  @override
  State<CartaoBankPage> createState() => _CartaoBankPageState();
}

class _CartaoBankPageState extends State<CartaoBankPage> {
  bool mostrarLimite = true;

  @override
  Widget build(BuildContext context) {
    final cartaoController = Get.find<CartaoController>();
    final faturaController = Get.find<FaturaController>();
    final currency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 180,
          child: Obx(() {
            final cartoes = cartaoController.cartoes;
            if (cartoes.isEmpty) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }

            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: cartoes.map((cartao) {
                  final ativo =
                      cartaoController.cartaoAtivo.value?.id == cartao.id;

                  return Padding(
                    padding: const EdgeInsets.only(right: 12),
                    child: GestureDetector(
                      behavior: HitTestBehavior.deferToChild,
                      onTap: () async {
                        cartaoController.selecionarCartao(cartao.id);
                        await faturaController.carregarFatura(cartao.id);
                      },
                      child: AnimatedOpacity(
                        duration: const Duration(milliseconds: 200),
                        opacity: ativo ? 1.0 : 0.5,
                        child: CartaoWidgets.buildCartao(
                          cartao: cartao,
                          mostrarLimite: mostrarLimite,
                          currency: currency,
                          onToggleVisibilidade: () {
                            setState(() {
                              mostrarLimite = !mostrarLimite;
                            });
                          },
                        ),
                      ),
                    ),
                  );
                }).toList(),
              ),
            );
          }),
        ),
      ],
    );
  }
}
