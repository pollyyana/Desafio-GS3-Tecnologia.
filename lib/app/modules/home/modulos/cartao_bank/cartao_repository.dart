import 'package:gs3_tecnologia/app/models/cartao_model.dart';

abstract class CartaoRepository {
  Future<List<CartaoModel>> getAll();
}
