import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/theme/todo_list_ui_config.dart';
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
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Últimos lançamentos',
                  style: context.mulishBold.copyWith(
                    fontSize: 18,
                    color: Colors.black,
                  ),
                ),
              ),
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
