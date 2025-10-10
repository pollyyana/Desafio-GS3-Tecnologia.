import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/helpers/loader/loader_mixin.dart';

class HomeController extends GetxController with LoaderMixin {
  final isLoading = false.obs;

  @override
  void onInit() {
    super.onInit();
    showLoader(isLoading);
  }

  Future<void> logout() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed('/login');
  }
}
