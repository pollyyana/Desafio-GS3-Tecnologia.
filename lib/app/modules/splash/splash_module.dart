import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';
import 'package:gs3_tecnologia/application/modules/module.dart';

class SplashModule implements Module {
  @override
  List<GetPage> routers = [
    GetPage(
      name: '/',
      page: () => SplashPage(),
    ),
  ];
}
