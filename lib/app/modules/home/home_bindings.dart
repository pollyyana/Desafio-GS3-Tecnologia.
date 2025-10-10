import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/models/user_model.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_repositories.dart';
import 'package:gs3_tecnologia/app/modules/home/home_controller.dart';

class HomeBindings implements Bindings {
  @override
  void dependencies() {
    final user = Get.arguments as UserModel;

    // Controller principal da Home
    Get.put(HomeController());

    // Controller de cartões vinculado ao usuário logado
    Get.lazyPut(() {
      final controller = CartaoController(CartaoRepository(Dio()));
      controller.fetchCartoes(user.id);
      return controller;
    });
  }
}
