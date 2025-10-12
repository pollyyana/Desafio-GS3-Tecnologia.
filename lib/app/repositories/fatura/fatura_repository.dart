import 'package:gs3_tecnologia/app/models/fatura_model.dart';

abstract class FaturaRepository {
  Future<List<FaturaModel>> buscarFaturasPorCartao(int cartaoId);
  Future<void> salvarFatura(FaturaModel fatura, int cartaoId);
}
