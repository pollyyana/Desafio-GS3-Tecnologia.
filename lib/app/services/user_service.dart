import 'package:gs3_tecnologia/app/models/user_model.dart';
import 'package:gs3_tecnologia/app/modules/login/login_repository.dart';

class UserService {
  final LoginRepository _repository;

  UserService(this._repository);

  // Método de login que consulta o banco
  Future<UserModel?> login(String cpf, String senha) async {
    // Aqui, você pode utilizar o repositório para buscar o usuário no banco
    final user = await _repository.getUserByCpf(cpf);

    // Verifica se o usuário existe e se a senha está correta
    if (user != null && user.password == senha) {
      return user; // Login bem-sucedido
    }

    return null; // Login falhou
  }
}
