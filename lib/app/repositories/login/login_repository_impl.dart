import 'dart:developer';

import 'package:gs3_tecnologia/app/database/sqlite_connection_factory.dart';
import 'package:gs3_tecnologia/app/exceptions/exception.dart';
import 'package:gs3_tecnologia/app/models/user_model.dart';

import 'login_repository.dart';

class LoginRepositoryImpl implements LoginRepository {
  final SqliteConnectionFactory _connectionFactory;

  LoginRepositoryImpl(this._connectionFactory);

  @override
  Future<UserModel?> getUserByCpf(String cpf) async {
    try {
      final db = await _connectionFactory.openConnection();

      final inputCpf = cpf.trim();

      final result = await db.query(
        'users',
        where: 'cpf = ?',
        whereArgs: [inputCpf],
      );

      if (result.isNotEmpty) {
        final user = UserModel.fromMap(result.first);
        log('Usuário encontrado: ${user.name}', name: 'LoginRepositoryImpl');
        return user;
      } else {
        log(
          'Nenhum usuário encontrado para CPF: $inputCpf',
          name: 'LoginRepositoryImpl',
        );
        return null;
      }
    } catch (e, s) {
      log(
        'Erro ao consultar usuário no banco: $e',
        name: 'LoginRepositoryImpl',
        error: e,
        stackTrace: s,
      );
      throw AppException('Erro ao acessar os dados do usuário.');
    }
  }
}
