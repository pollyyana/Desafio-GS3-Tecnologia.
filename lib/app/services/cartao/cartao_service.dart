import 'package:gs3_tecnologia/app/models/cartao_model.dart';

abstract class CartaoService {
  Future<List<CartaoModel>> getAll();
}
