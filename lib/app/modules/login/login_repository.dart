import 'package:dio/dio.dart';
import 'package:gs3_tecnologia/app/core/error/app_error.dart';
import 'package:gs3_tecnologia/app/models/user_model.dart';

class LoginRepository {
  final Dio _dio;

  LoginRepository(this._dio);

  Future<UserModel> login(String cpf, String password) async {
    try {
      final response = await _dio.get(
        '/users',
        queryParameters: {
          'cpf': cpf.replaceAll('.', '').replaceAll('-', ''),
          'password': password,
        },
      );

      // ⚙️ json-server retorna lista
      final data = response.data;
      if (data is List && data.isNotEmpty) {
        return UserModel.fromJson(data.first);
      } else {
        throw AppError('Usuário ou senha inválidos.');
      }
    } catch (e) {
      throw AppError('Falha ao efetuar login. Verifique os dados.');
    }
  }
}
