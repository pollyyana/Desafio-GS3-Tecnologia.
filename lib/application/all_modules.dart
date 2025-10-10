import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_bindings.dart';
import 'package:gs3_tecnologia/app/modules/home/home_bindings.dart';
import 'package:gs3_tecnologia/app/modules/home/home_page.dart';
import 'package:gs3_tecnologia/app/modules/login/login_bindings.dart';
import 'package:gs3_tecnologia/app/modules/login/login_page.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_binding.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';

class AllModules {
  List<GetPage> get routers => [
    GetPage(
      name: '/',
      page: () => const SplashPage(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: '/login',
      page: () => const LoginPage(),
      binding: LoginBindings(),
    ),
    GetPage(
      name: '/home',
      page: () => HomePage(),
      bindings: [
        HomeBindings(),
        FaturaBinding(),
      ],
    ),
  ];
}
