import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/app_bar_inferior.dart/bottom_bar_widget.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_bank_widget.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_repositories.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_controller.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_repository.dart';
import 'package:gs3_tecnologia/app/modules/home/home_controller.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/appbar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/favoritos_widget.dart';

class HomePage extends StatelessWidget {
  HomePage({super.key});

  final controller = Get.find<HomeController>();
  final cartaoController = Get.put(
    CartaoController(CartaoRepository(Dio())),
    permanent: true,
  );
  final faturaController = Get.put(
    FaturaController(FaturaRepository(Dio())),
    permanent: true,
  );

  @override
  Widget build(BuildContext context) {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      const userId = 1;
      await cartaoController.fetchCartoes(userId);

      if (cartaoController.cartoes.isNotEmpty) {
        final cartaoAtivo = cartaoController.cartoes.first;
        await faturaController.carregarFatura(cartaoAtivo.id);
      }
    });

    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF2B66BC), Colors.white],
            stops: [0.0, 0.5],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(17.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarWidget(),
                const SizedBox(height: 1),
                const Divider(
                  color: Colors.white,
                ),
                const SizedBox(
                  height: 5,
                ),

                Obx(() {
                  final cartoes = cartaoController.cartoes;
                  if (cartoes.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: cartoes.map((cartao) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () async {
                              cartaoController.selecionarCartao(cartao.id);
                              await faturaController.carregarFatura(cartao.id);
                            },
                            child: SizedBox(
                              width: 300,
                              child: Obx(() {
                                final ativo =
                                    cartaoController.cartaoAtivo.value?.id ==
                                    cartao.id;
                                return Opacity(
                                  opacity: ativo ? 1.0 : 0.5,
                                  child: CartaoBankWidget(cartao: cartao),
                                );
                              }),
                            ),
                          ),
                        );
                      }).toList(),
                    ),
                  );
                }),

                const SizedBox(height: 8),
                Divider(color: Colors.grey[200]),
                const FavoritosWidget(),
                const SizedBox(height: 8),
                Divider(color: Colors.grey[200]),
                const SizedBox(height: 8),
                const Fatura(),
              ],
            ),
          ),
        ),
      ),

      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
