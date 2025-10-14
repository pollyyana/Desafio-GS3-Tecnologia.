import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gs3_tecnologia/app/core/theme/todo_list_ui_config.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/appbarinferior/bottom_bar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_bank_page.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_page.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/appbar_widget.dart';
import 'package:gs3_tecnologia/app/modules/home/widgets/favoritos_widget.dart';

class HomePage extends StatefulWidget {
  final String? usuarioNome;
  const HomePage({super.key, this.usuarioNome});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool mostrarFatura = true;

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
              AppbarWidget(usuarioNome: widget.usuarioNome ?? 'Cliente'),
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
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          mostrarFatura = !mostrarFatura;
                        });
                      },
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
                              mostrarFatura ? 'Ocultar' : 'Ver todos',
                              style: GoogleFonts.mulish(
                                fontSize: 13,
                                fontWeight: FontWeight.w600,
                                color: const Color(0xFF2B66BC),
                              ),
                            ),
                            const SizedBox(width: 6),
                            AnimatedRotation(
                              turns: mostrarFatura ? 0.5 : 0,
                              duration: const Duration(milliseconds: 300),
                              child: Image.asset(
                                ImageConstants.arrowRight,
                                width: 15,
                                height: 14,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Expanded(
                child: mostrarFatura
                    ? SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: const FaturaPage(),
                      )
                    : const SizedBox.shrink(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
