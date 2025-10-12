import 'package:gs3_tecnologia/app/models/fatura_model.dart';
import 'package:gs3_tecnologia/app/repositories/fatura/fatura_repository.dart';
import 'package:gs3_tecnologia/app/services/fatura/fatura_service.dart';

class FaturaServiceImpl implements FaturaService {
  final FaturaRepository _repository;

  FaturaServiceImpl({required FaturaRepository repository})
    : _repository = repository;

  @override
  Future<List<FaturaModel>> buscarFaturasPorCartao(int cartaoId) {
    return _repository.buscarFaturasPorCartao(cartaoId);
  }

  @override
  Future<void> salvarFatura(FaturaModel fatura, int cartaoId) async {
    await _repository.salvarFatura(fatura, cartaoId);
  }
}
