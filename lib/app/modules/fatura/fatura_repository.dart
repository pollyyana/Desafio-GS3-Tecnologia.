import 'package:dio/dio.dart';

class FaturaRepository {
  final Dio _dio;
  final String baseUrl = 'http://192.168.15.6:8080';

  FaturaRepository(this._dio);

  Future<List<Map<String, dynamic>>> getFaturas(int cartaoId) async {
    try {
      final response = await _dio.get(
        '$baseUrl/transactions?cartaoId=$cartaoId',
      );
      return List<Map<String, dynamic>>.from(response.data);
    } catch (e) {
      throw Exception('Erro ao buscar faturas: $e');
    }
  }
}
