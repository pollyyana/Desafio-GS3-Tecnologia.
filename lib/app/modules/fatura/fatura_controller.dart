import 'package:get/get.dart';
import 'package:gs3_tecnologia/app/models/fatura_model.dart';
import 'package:gs3_tecnologia/app/modules/fatura/fatura_repository.dart';

class FaturaController extends GetxController {
  final FaturaRepository repository;
  final _faturas = <FaturaModel>[].obs;
  List<FaturaModel> get faturas => _faturas;

  FaturaController(this.repository);

  Future<void> carregarFatura(int cartaoId) async {
    try {
      final data = await repository.getFaturas(cartaoId);
      _faturas.value = data.map((json) => FaturaModel.fromJson(json)).toList();
    } catch (e) {
      _faturas.clear();
      print('Erro ao carregar faturas: $e');
    }
  }
}
