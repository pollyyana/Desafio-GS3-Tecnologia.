import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  // Pode receber o repositório via construtor, por exemplo:
  // final UserRepository _userRepository;
  // LoginController(this._userRepository);

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void checkFormValidity(String cpf, String senha) {
    final isValid = cpf.trim().isNotEmpty && senha.trim().isNotEmpty;
    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      notifyListeners();
    }
  }

  Future<bool> login({required String cpf, required String senha}) async {
    // Aqui você pode chamar o banco, validar usuário, etc.
    // Exemplo fictício:
    // final user = await _userRepository.getUserByCpf(cpf);
    // if (user != null && user.password == senha) return true;

    print('Login com CPF: $cpf e Senha: $senha');
    return true;
  }
}
