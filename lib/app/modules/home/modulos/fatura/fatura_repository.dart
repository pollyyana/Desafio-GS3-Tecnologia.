// import 'package:dio/dio.dart';
// import 'package:gs3_tecnologia/app/core/config/app_config.dart';

// class FaturaRepository {
//   final Dio _dio;
//   final String baseUrl = AppConfig.baseUrl;

//   FaturaRepository(this._dio);

//   Future<List<Map<String, dynamic>>> getFaturas(int cartaoId) async {
//     try {
//       final response = await _dio.get(
//         '$baseUrl/transactions?cartaoId=$cartaoId',
//       );
//       return List<Map<String, dynamic>>.from(response.data);
//     // } catch (e) {
//       throw Exception('Erro ao buscar faturas: $e');
//     }
//   }
// }
