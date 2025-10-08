import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_controller.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

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
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(ImageConstants.backgroudChair),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: Get.height * 0.15,
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
          Positioned(
            top: Get.height * 0.50,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => controller.toggleLoginVisibility(),
                child: Image.asset(
                  ImageConstants.entrar,
                  width: 80,
                ),
              ),
            ),
          ),
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
          // Login Page como overlay
          Obx(() {
            if (controller.showLogin.value) {
              return Positioned.fill(
                child: GestureDetector(
                  onTap: () => controller.toggleLoginVisibility(),
                  child: Container(
                    color: Colors.black.withValues(alpha: 0.3),
                    child: const LoginPage(),
                  ),
                ),
              );
            }
            return const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
