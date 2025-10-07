// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:gs3_tecnologia/app/modules/splash/pagina.dart';

// class SplashPage extends StatelessWidget {
//   // var controller = Get.find<SplashController>();
//   // var controller = Get.put(SplashController());

//   const SplashPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Stack(
//         children: [
//           Container(
//             width: Get.width,
//             height: Get.height,
//             decoration: const BoxDecoration(
//               image: DecorationImage(
//                 image: AssetImage('assets/images/background.png'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//           ),
//           Positioned(
//             top: Get.height * 0.15,
//             left: 60,
//             right: 60,
//             child: Column(
//               children: [
//                 Image.asset(
//                   'assets/images/logo.png',
//                   width: 242,
//                 ),
//                 const SizedBox(height: 8),
//               ],
//             ),
//           ),
//           // Entrar
//           Positioned(
//             top: Get.height * 0.45,
//             left: 0,
//             right: 0,
//             child: Stack(
//               alignment: Alignment.center,
//               children: [
//                 GestureDetector(
//                   onTap: () {
//                     Get.to(() => Pagina());
//                   },
//                   child: Image.asset(
//                     'assets/images/entrar.png',
//                     width: 80,
//                   ),
//                 ),
//               ],
//             ),
//           ),

//           Positioned(
//             bottom: 87,
//             left: 0,
//             right: 0,
//             child: SingleChildScrollView(
//               scrollDirection: Axis.horizontal,
//               padding: const EdgeInsets.only(left: 22, right: 24),
//               child: Image.asset(
//                 'assets/images/frame.png',
//                 width: 331,
//                 fit: BoxFit.contain,
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_controller.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';

class SplashPage extends GetView<SplashController> {
  const SplashPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Fundo
          Container(
            width: Get.width,
            height: Get.height,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/background.png'),
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
                  'assets/images/logo.png',
                  width: 242,
                ),
                const SizedBox(height: 8),
              ],
            ),
          ),
          Positioned(
            top: Get.height * 0.45,
            left: 0,
            right: 0,
            child: Center(
              child: GestureDetector(
                behavior: HitTestBehavior.translucent,
                onTap: () => controller.toggleLoginVisibility(),
                child: Image.asset(
                  'assets/images/entrar.png',
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
              padding: const EdgeInsets.symmetric(horizontal: 22),
              child: Image.asset(
                'assets/images/frame.png',
                width: 331,
                fit: BoxFit.contain,
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
                    color: Colors.black.withOpacity(0.3),
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
// O behavior: HitTestBehavior.translucent garante que o clique só responda sobre a área da imagem.
