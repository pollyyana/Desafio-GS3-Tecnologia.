import 'dart:developer';

import 'package:gs3_tecnologia/app/exceptions/exception.dart';
import 'package:gs3_tecnologia/app/models/user_model.dart';
import 'package:gs3_tecnologia/app/repositories/login/login_repository.dart';
import 'package:gs3_tecnologia/app/services/login/login_service.dart';

class LoginServiceImpl implements LoginService {
  final LoginRepository _repository;

  // Usuário logado atualmente
  UserModel? _currentUser;
  @override
  UserModel? get currentUser => _currentUser;

  LoginServiceImpl({required LoginRepository repository})
    : _repository = repository;

  @override
  Future<UserModel?> login(String cpf, String password) async {
    try {
      log('Tentando login com CPF: $cpf', name: 'LoginServiceImpl');

      final user = await _repository.getUserByCpf(cpf);

      if (user == null) {
        log('Usuário não encontrado para CPF: $cpf', name: 'LoginServiceImpl');
        throw AppException('Usuário não encontrado.');
      }

      if (user.password != password) {
        log('Senha incorreta para CPF: $cpf', name: 'LoginServiceImpl');
        throw AppException('Senha incorreta.');
      }

      log('Login bem-sucedido para ${user.name}', name: 'LoginServiceImpl');

      // Salva o usuário logado em memória
      _currentUser = user;

      return user;
    } on AppException {
      rethrow;
    } catch (e, s) {
      log(
        'Erro inesperado ao fazer login: $e',
        name: 'LoginServiceImpl',
        error: e,
        stackTrace: s,
      );
      throw AppException('Erro ao tentar realizar o login. Tente novamente.');
    }
  }

  @override
  Future<void> logout() async {
    try {
      log('Iniciando logout do usuário atual...', name: 'LoginServiceImpl');

      // Limpa o usuário logado da memória
      _currentUser = null;

      // Futuramente, se quiser apagar dados locais:
      // await _repository.clearSession();

      log('Logout concluído com sucesso', name: 'LoginServiceImpl');
    } catch (e, s) {
      log(
        'Erro ao tentar realizar logout: $e',
        name: 'LoginServiceImpl',
        error: e,
        stackTrace: s,
      );
      throw AppException('Erro ao tentar sair da conta. Tente novamente.');
    }
  }
}
