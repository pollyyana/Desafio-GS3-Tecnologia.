import 'package:flutter/material.dart';

class SplashController extends ChangeNotifier {
  bool _showLogin = false;

  bool get showLogin => _showLogin;

  void toggleLoginVisibility() {
    _showLogin = !_showLogin;
    notifyListeners();
  }
}

// class SplashController extends GetxController {
//   RxBool showLogin = false.obs;
//   void toggleLoginVisibility() {
//     showLogin.value = !showLogin.value;
//   }
// }
