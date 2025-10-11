import 'package:gs3_tecnologia/app/models/user_model.dart';

abstract class LoginRepository {
  Future<UserModel?> getUserByCpf(
    String cpf,
  ); // Método para buscar o usuário por CPF
  Future<bool> login({required String cpf, required String senha});
}
