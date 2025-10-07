import 'package:get/get.dart';

class SplashController extends GetxController {
  RxBool showLogin = false.obs;

  void toggleLoginVisibility() {
    showLogin.value = !showLogin.value;
  }
}
