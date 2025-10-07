import 'package:get/get.dart';

class LoginController extends GetxController {
  RxString nome = RxString('pollyana');
  void login() {
    nome.value = 'testando';
  }
}
