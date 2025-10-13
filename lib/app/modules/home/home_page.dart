import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';
import 'package:gs3_tecnologia/app/core/widgets/todo_list_ui_config.dart';
import 'package:gs3_tecnologia/app/modules/app_bar_inferior.dart/bottom_bar_widget.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_bank_page.dart';
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

  // 🔹 Estado local para controlar se a fatura está visível
  final RxBool mostrarFatura = true.obs;

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
      extendBody: true,
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3C6AB2), Colors.white],
            stops: [0.0, 0.5],
          ),
        ),
        child: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [Color(0xFF2B66BC), Colors.white],
              stops: [0.0, 0.5],
            ),
          ),
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.only(left: 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppbarWidget(),
                  const SizedBox(height: 1),
                  const Divider(color: Colors.white, endIndent: 19),
                  const SizedBox(height: 5),
                  CartaoBankPage(),
                  const SizedBox(height: 12),
                  Divider(color: Colors.grey[200], endIndent: 19),
                  const FavoritosWidget(),
                  const SizedBox(height: 12),
                  Divider(color: Colors.grey[200], endIndent: 19),

                  // 🔹 Cabeçalho "Últimos lançamentos" com botão
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Últimos lançamentos',
                          style: context.mulishBold.copyWith(
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                        Obx(() {
                          return GestureDetector(
                            onTap: () =>
                                mostrarFatura.value = !mostrarFatura.value,
                            child: Container(
                              padding: const EdgeInsets.symmetric(
                                horizontal: 8,
                                vertical: 4,
                              ),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                color: Colors.transparent,
                              ),
                              child: Row(
                                children: [
                                  Text(
                                    mostrarFatura.value
                                        ? 'Ocultar'
                                        : 'Ver todos',
                                    style: GoogleFonts.mulish(
                                      fontSize: 13,
                                      fontWeight: FontWeight.w600,
                                      color: const Color(0xFF2B66BC),
                                    ),
                                  ),
                                  const SizedBox(width: 6),
                                  Transform.rotate(
                                    angle: mostrarFatura.value ? 3.14 : 0,
                                    child: Image.asset(
                                      ImageConstants.arrow,
                                      width: 15,
                                      height: 14,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        }),
                      ],
                    ),
                  ),
                  const SizedBox(height: 8),

                  // 🔹 Só a fatura terá scroll próprio
                  Obx(
                    () => mostrarFatura.value
                        ? Expanded(
                            child: SingleChildScrollView(
                              physics: const BouncingScrollPhysics(),
                              child: const Fatura(),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomBarWidget(),
    );
  }
}
