import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gs3_tecnologia/app/core/theme/todo_list_ui_config.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/appbarinferior/bottom_bar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_bank_page.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_page.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/appbar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/favoritos_widget.dart';

class HomePage extends StatelessWidget {
  final String? usuarioNome;
  const HomePage({super.key, this.usuarioNome});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      bottomNavigationBar: const BottomBarWidget(),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Color(0xFF3C6AB2), Colors.white],
            stops: [0.0, 0.5],
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.only(left: 10, right: 10, top: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              AppbarWidget(usuarioNome: usuarioNome ?? 'Cliente'),
              const Divider(color: Colors.white, thickness: 1, endIndent: 19),
              const SizedBox(height: 10),
              const CartaoBankPage(),
              const SizedBox(height: 5),
              const Divider(color: Colors.white, endIndent: 19),
              const Padding(
                padding: EdgeInsets.only(left: 6),
                child: FavoritosWidget(),
              ),
              const SizedBox(height: 10),
              const Divider(
                color: Colors.black12,
                thickness: 0.6,
                endIndent: 19,
              ),
              const SizedBox(height: 10),

              // Cabeçalho "Últimos lançamentos" com "Ver todos" e seta
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
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
                    Row(
                      children: [
                        Text(
                          'Ver todos',
                          style: GoogleFonts.mulish(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color: const Color(0xFF2B66BC),
                          ),
                        ),
                        const SizedBox(width: 6),
                        Image.asset(
                          ImageConstants.arrowRight,
                          width: 14,
                          height: 14,
                        ),
                      ],
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),

              Expanded(
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: const FaturaPage(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
