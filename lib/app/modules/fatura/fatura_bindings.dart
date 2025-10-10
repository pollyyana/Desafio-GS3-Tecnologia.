import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_controller.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_repository.dart';

class FaturaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<FaturaRepository>(() => FaturaRepository(Dio()));
    Get.lazyPut<FaturaController>(
      () => FaturaController(Get.find<FaturaRepository>()),
    );
  }
}
