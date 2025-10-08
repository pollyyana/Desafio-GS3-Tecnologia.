import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/helpers/loader/loader_mixin.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';

class HomeController extends GetxController with LoaderMixin {
  final isLoading = false.obs;

  final _digitos = 5621.obs;
  final _name = 'GS3 TEC'.obs;
  final _limit = 7867.80.obs;
  final _day = 20.obs;

  final _cartoes = <CartaoModel>[].obs;
  List<CartaoModel> get cartoes => _cartoes;

  int get digitos => _digitos.value;
  String get name => _name.value;
  double get limit => _limit.value;
  int get day => _day.value;

  @override
  void onInit() {
    super.onInit();
    showLoader(isLoading);
    fetchCartao();
  }

  Future<void> fetchCartao() async {
    isLoading.value = true;

    await Future.delayed(const Duration(seconds: 1));

    final cartao1 = CartaoModel(
      id: 1,
      bankName: 'GS3 TEC',
      lastDigits: '1122',
      availableLimit: 4321.90,
      bestPurchaseDay: 12,
      userId: 1,
    );

    final cartao2 = CartaoModel(
      id: 2,
      bankName: 'BANCO XPTO',
      lastDigits: '9988',
      availableLimit: 9850.75,
      bestPurchaseDay: 25,
      userId: 1,
    );

    _cartoes.assignAll([cartao1, cartao2]);

    isLoading.value = false;
  }

  Future<void> logout() async {
    isLoading.value = true;
    await Future.delayed(const Duration(seconds: 2));
    isLoading.value = false;
    Get.offAllNamed('/login');
  }
}
