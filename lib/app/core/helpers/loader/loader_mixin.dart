import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void showLoader(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        if (Get.isDialogOpen != true) {
          await Get.dialog(
            const Center(child: CircularProgressIndicator()),
            barrierDismissible: false,
          );
        }
      } else {
        if (Get.isDialogOpen == true) {
          Get.back();
        }
      }
    });
  }
}
