import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/exceptions/exception.dart';
import 'package:gs3_tecnologia/app/models/fatura_model.dart';
import 'package:gs3_tecnologia/app/services/fatura/fatura_service.dart';

class FaturaController extends ChangeNotifier {
  final FaturaService _faturaService;

  List<FaturaModel> faturas = [];
  bool isLoading = false;
  String? errorMessage;

  FaturaController({required FaturaService faturaService})
    : _faturaService = faturaService;

  Future<void> carregarFaturas(int cartaoId) async {
    debugPrint('Iniciando carregamento das faturas do cartão ID: $cartaoId');

    isLoading = true;
    errorMessage = null;
    notifyListeners();

    try {
      faturas = await _faturaService.buscarFaturasPorCartao(cartaoId);
      debugPrint(
        '${faturas.length} faturas carregadas para o cartão $cartaoId',
      );

      if (faturas.isEmpty) {
        errorMessage = 'Nenhuma fatura encontrada para este cartão.';
      }
    } on AppException catch (e) {
      errorMessage = e.message;
      debugPrint('Erro de aplicação ao carregar faturas: ${e.message}');
    } catch (e, s) {
      errorMessage = 'Erro inesperado ao carregar faturas';
      debugPrint('Erro inesperado: $e\n$s');
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  Future<void> adicionarFatura(FaturaModel fatura, int cartaoId) async {
    try {
      debugPrint('Adicionando nova fatura ao cartão $cartaoId');
      await _faturaService.salvarFatura(fatura, cartaoId);
      await carregarFaturas(cartaoId);
    } on AppException catch (e) {
      debugPrint('Erro ao adicionar fatura: ${e.message}');
      errorMessage = e.message;
      notifyListeners();
    } catch (e, s) {
      debugPrint('Erro inesperado ao adicionar fatura: $e\n$s');
      errorMessage = 'Erro inesperado ao adicionar fatura';
      notifyListeners();
    }
  }
}
