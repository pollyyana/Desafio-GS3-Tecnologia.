import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';

class LoginBindigs implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => LoginController());
  }
}
