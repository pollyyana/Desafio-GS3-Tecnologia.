import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/models/user_model.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SqliteConnectionFactory _connectionFactory;

  LoginRepositoryImpl(this._connectionFactory);

  @override
  Future<UserModel?> getUserByCpf(String cpf) async {
    final db = await _connectionFactory.openConnection();

    // Consulta o usuário pelo CPF
    final result = await db.query(
      'users',
      where: 'cpf = ?',
      whereArgs: [cpf],
    );

    // Se encontrar, retorna o primeiro usuário encontrado
    if (result.isNotEmpty) {
      return UserModel.fromMap(
        result.first,
      ); // Assumindo que o UserModel tem um fromMap
    }

    return null; // Retorna null se não encontrar
  }

  @override
  Future<bool> login({required String cpf, required String senha}) async {
    final user = await getUserByCpf(cpf);
    if (user != null && user.password == senha) {
      return true; // Login bem-sucedido
    }
    return false; // Login falhou
  }
}
