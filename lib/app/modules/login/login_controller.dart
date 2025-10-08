import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/helpers/loader/loader_mixin.dart';

class LoginController extends GetxController with LoaderMixin {
  final loading = false.obs;

  @override
  void onInit() {
    super.onInit();
    showLoader(loading);
  }

  Future<void> login() async {
    loading.value = true;
    await Future.delayed(Duration(seconds: 2));
    loading.value = false;

    //sucesso
    Get.offNamed('/home');
  }
}
