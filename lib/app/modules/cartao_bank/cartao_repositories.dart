import 'package:dio/dio.dart';

class CartaoRepository {
  final Dio _dio;
  final String baseUrl = 'http://192.168.15.6:8080';

  CartaoRepository(this._dio);

  Future<List<Map<String, dynamic>>> getCartoes(int userId) async {
    try {
      final response = await _dio.get('$baseUrl/cartoes?userId=$userId');
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw Exception('Erro ao buscar cartões: $e');
    }
  }
}
