import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/core/helpers/loader/loader_mixin.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_repositories.dart';

class CartaoController extends GetxController with LoaderMixin {
  final CartaoRepository _repository;

  final _cartoes = <CartaoModel>[].obs;
  List<CartaoModel> get cartoes => _cartoes;

  final _loading = false.obs;

  CartaoController(this._repository);

  @override
  void onInit() {
    super.onInit();
    showLoader(_loading);
    fetchCartoes();
  }

  Future<void> fetchCartoes() async {
    try {
      _loading(true);
      await Future.delayed(const Duration(seconds: 1)); // mock simples

      _cartoes.assignAll([
        CartaoModel(
          id: 1,
          bankName: 'Banco Azul',
          lastDigits: '1234',
          availableLimit: 2500.75,
          bestPurchaseDay: 10,
          userId: 1,
        ),
        CartaoModel(
          id: 2,
          bankName: 'Banco Verde',
          lastDigits: '5678',
          availableLimit: 4800.00,
          bestPurchaseDay: 20,
          userId: 1,
        ),
      ]);
    } catch (e) {
      print('Erro ao buscar cartões: $e');
    } finally {
      _loading(false);
    }
  }
}
