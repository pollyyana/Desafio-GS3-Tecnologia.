import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/exceptions/exception.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:gs3_tecnologia/app/services/cartao/cartao_service.dart';

class CartaoController extends ChangeNotifier {
  final CartaoService _cartaoService;

  CartaoController({required CartaoService cartaoService})
    : _cartaoService = cartaoService;

  bool isLoading = false;
  List<CartaoModel> cartoes = [];

  Future<void> fetchCartoes() async {
    try {
      isLoading = true;
      notifyListeners();

      cartoes = await _cartaoService.getAll();
    } on AppException catch (e) {
      debugPrint('Erro ao buscar cartões: ${e.message}');
      cartoes = [];
    } catch (e) {
      debugPrint('Erro inesperado: $e');
      cartoes = [];
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }
}
