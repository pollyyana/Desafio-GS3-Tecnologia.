import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/error/app_error.dart';
import 'package:gs3_tecnologia/app/core/helpers/loader/loader_mixin.dart';
import 'package:gs3_tecnologia/app/modules/login/login_repository.dart';

class LoginController extends GetxController with LoaderMixin {
  final LoginRepository? _repository;
  final loading = false.obs;

  LoginController([this._repository]);

  @override
  void onInit() {
    super.onInit();
    showLoader(loading);
  }

  Future<void> login({required String cpf, required String senha}) async {
    loading.value = true;

    try {
      final user = await _repository!.login(cpf, senha);

      // Fecha loader ANTES de navegar
      loading.value = false;
      await Future.delayed(const Duration(milliseconds: 250));

      if (Get.isDialogOpen == true) {
        Get.back();
      }

      // Envia o user para a Home
      Get.offNamed('/home', arguments: user);
    } on AppError catch (e) {
      loading.value = false;
      Get.snackbar(
        'Erro ao entrar',
        e.message,
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
    } catch (e) {
      loading.value = false;
      Get.snackbar(
        'Erro',
        'Ocorreu um erro inesperado. Tente novamente.',
        snackPosition: SnackPosition.BOTTOM,
        backgroundColor: Colors.redAccent,
        colorText: Colors.white,
      );
      debugPrint('Erro inesperado no login: $e');
    }
  }
}
