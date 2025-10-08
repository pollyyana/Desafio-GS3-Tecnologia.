import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_bank_widget.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_repositories.dart';
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xFF2B66BC),
              Colors.white,
            ],
            stops: [0.0, 0.8],
          ),
        ),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const AppbarWidget(),
                const SizedBox(height: 8),
                const Divider(),
                Obx(() {
                  final cartoes = cartaoController.cartoes;
                  if (cartoes.isEmpty) {
                    return const Center(child: CircularProgressIndicator());
                  }

                  return SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      children: cartoes
                          .map(
                            (cartao) => Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: SizedBox(
                                width: 300,
                                child: CartaoBankWidget(cartao: cartao),
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  );
                }),

                const SizedBox(height: 8),
                const Divider(),
                const FavoritosWidget(),
                const SizedBox(height: 8),
                const Divider(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
