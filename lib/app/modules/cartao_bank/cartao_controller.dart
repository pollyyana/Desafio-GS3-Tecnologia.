import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:gs3_tecnologia/app/modules/cartao_bank/cartao_repositories.dart';

class CartaoController extends GetxController {
  final CartaoRepository repository;
  CartaoController(this.repository);

  final cartoes = <CartaoModel>[].obs;
  final cartaoAtivo = Rxn<CartaoModel>();

  Future<void> fetchCartoes(int userId) async {
    try {
      final data = await repository.getCartoes(userId);
      cartoes.value = data
          .map<CartaoModel>((json) => CartaoModel.fromJson(json))
          .toList();
      if (cartoes.isNotEmpty) {
        cartaoAtivo.value = cartoes.first;
      }
    } catch (e) {
      cartoes.clear();
      print('Erro ao buscar cartões: $e');
    }
  }

  void selecionarCartao(int id) {
    final selecionado = cartoes.firstWhereOrNull((c) => c.id == id);
    if (selecionado != null) {
      cartaoAtivo.value = selecionado;
    }
  }
}
