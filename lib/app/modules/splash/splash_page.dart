import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/theme/theme_extension.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';
import 'package:provider/provider.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  bool showLogin = false;

  void toggleLoginVisibility() {
    setState(() {
      showLogin = !showLogin;
    });
  }

  Widget imagens(String imagePath) {
    return Image.asset(
      imagePath,
      width: 100,
      height: 87,
      fit: BoxFit.contain,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Background
          Container(
            width: context.width(1.0),
            height: context.height(1.0),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.backgroudChair),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Logo na Splash
          Positioned(
            top: context.height(0.15),
            left: 60,
            right: 60,
            child: Column(
              children: [
                Image.asset(
                  ImageConstants.imageLogo,
                  width: 242,
                  height: 157,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),

          // Botão para login
          Positioned(
            top: context.height(0.50),
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: toggleLoginVisibility,
                child: Image.asset(
                  ImageConstants.entrar,
                  width: 80,
                ),
              ),
            ),
          ),

          // Ícones abaixo da Splash
          Positioned(
            bottom: 87,
            left: 0,
            right: 0,
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  imagens(ImageConstants.solicitar),
                  const SizedBox(width: 12),
                  imagens(ImageConstants.acompanhar),
                  const SizedBox(width: 12),
                  imagens(ImageConstants.perguntas),
                  const SizedBox(width: 12),
                  imagens(ImageConstants.atendimento),
                ],
              ),
            ),
          ),

          // Exibe o LoginPage quando showLogin for true
          if (showLogin)
            Positioned.fill(
              child: GestureDetector(
                onTap: toggleLoginVisibility,
                child: Container(
                  color: Colors.black.withOpacity(0.3),
                  child: ChangeNotifierProvider.value(
                    value: context
                        .read<
                          LoginController
                        >(), // Usando o LoginController injetado
                    child: const LoginPage(),
                  ),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
