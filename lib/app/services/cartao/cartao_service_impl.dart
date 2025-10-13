import 'package:gs3_tecnologia/app/exceptions/exception.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:gs3_tecnologia/app/repositories/cartao_repository.dart';
import 'package:gs3_tecnologia/app/services/cartao/cartao_service.dart';

class CartaoServiceImpl implements CartaoService {
  final CartaoRepository _repository;

  CartaoServiceImpl({required CartaoRepository repository})
    : _repository = repository;

  @override
  Future<List<CartaoModel>> getAll() async {
    try {
      final cartoes = await _repository.getAll();
      if (cartoes.isEmpty) {
        throw AppException('Nenhum cartão encontrado no banco.');
      }
      return cartoes;
    } catch (e) {
      throw AppException('Erro ao buscar cartões: $e');
    }
  }
}
