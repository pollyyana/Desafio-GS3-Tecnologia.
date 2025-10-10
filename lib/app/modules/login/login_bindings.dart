import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/api/api_client.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';
import 'package:gs3_tecnologia/app/modules/login/login_repository.dart';

class LoginBindings implements Bindings {
  @override
  void dependencies() {
    final dio = ApiClient.instance.dio;
    Get.lazyPut(() => LoginRepository(dio));
    Get.lazyPut(() => LoginController(Get.find<LoginRepository>()));
  }
}
