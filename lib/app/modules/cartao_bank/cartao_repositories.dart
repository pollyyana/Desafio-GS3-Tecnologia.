import 'package:dio/dio.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';

class CartaoRepository {
  final Dio _dio;

  CartaoRepository(this._dio);

  Future<List<CartaoModel>> fetchCartoes() async {
    final response = await _dio.get('http://192.168.15.6:8080/cards');

    if (response.statusCode == 200) {
      final data = response.data as List;
      return data.map((e) => CartaoModel.fromJson(e)).toList();
    } else {
      throw Exception('Erro ao buscar cartões (${response.statusCode})');
    }
  }
}
