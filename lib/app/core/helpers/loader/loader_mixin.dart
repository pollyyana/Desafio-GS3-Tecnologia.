import 'package:flutter/material.dart';
import 'package:get/get.dart';

mixin LoaderMixin on GetxController {
  void showLoader(RxBool loaderRx) {
    ever<bool>(loaderRx, (loading) async {
      if (loading) {
        // Espera um pouco antes de mostrar (evita "piscada" rápida)
        await Future.delayed(const Duration(milliseconds: 300));
        if (loaderRx.value && Get.isDialogOpen != true) {
          await Get.dialog(
            const _SimpleLoader(),
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

class _SimpleLoader extends StatelessWidget {
  const _SimpleLoader();

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withValues(alpha: 0.8),
      child: const Center(
        child: CircularProgressIndicator(
          strokeWidth: 3,
          color: Colors.blueAccent,
        ),
      ),
    );
  }
}
