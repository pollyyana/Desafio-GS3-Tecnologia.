import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/appbarinferior/bottom_bar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_bank_page.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_page.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/appbar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/favoritos_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          /// --- CONTEÚDO PRINCIPAL ---
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xFF2B66BC), Colors.white],
                stops: [0.0, 0.5],
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Column(
                children: [
                  const AppbarWidget(),
                  const Divider(
                    color: Colors.white,
                    thickness: 1,
                    endIndent: 19,
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 10),
                          const CartaoBankPage(),
                          const SizedBox(height: 5),
                          const Divider(color: Colors.white, endIndent: 19),
                          const Padding(
                            padding: EdgeInsets.only(left: 16),
                            child: FavoritosWidget(),
                          ),
                          const SizedBox(height: 10),
                          const Divider(
                            color: Colors.black12,
                            thickness: 0.6,
                            endIndent: 19,
                          ),
                          const SizedBox(height: 10),
                          const FaturaPage(),
                          const SizedBox(height: 30),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          /// --- BARRA INFERIOR FLUTUANTE + PÁGINAS SOBREPOSTAS ---
          const Align(
            alignment: Alignment.bottomCenter,
            child: BottomBarWidget(),
          ),
        ],
      ),
    );
  }
}
