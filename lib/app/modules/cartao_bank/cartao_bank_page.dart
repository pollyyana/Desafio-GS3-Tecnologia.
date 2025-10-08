import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_bank_widget.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_repositories.dart';

class CartaoBankPage extends StatelessWidget {
  final controller = Get.put(
    CartaoController(CartaoRepository(Dio())),
  );

  CartaoBankPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Meus Cartões")),
      body: Obx(() {
        final cartoes = controller.cartoes;

        if (cartoes.isEmpty) {
          return const Center(child: CircularProgressIndicator());
        }

        return SizedBox(
          height: 220,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 24),
            itemCount: cartoes.length,
            separatorBuilder: (_, __) => const SizedBox(width: 16),
            itemBuilder: (_, index) {
              return SizedBox(
                width: 300,
                child: CartaoBankWidget(cartao: cartoes[index]),
              );
            },
          ),
        );
      }),
    );
  }
}
