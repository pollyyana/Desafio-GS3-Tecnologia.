import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_controller.dart';

class SplashBinding implements Bindings {
  //controle pagina/carrega ou nao
  @override
  void dependencies() {
    Get.put(SplashController());
  }
}
