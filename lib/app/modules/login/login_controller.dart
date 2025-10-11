import 'package:flutter/material.dart';

class LoginController extends ChangeNotifier {
  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  // Troca visibilidade da senha
  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  // Valida se CPF e senha foram preenchidos
  void checkFormValidity(String cpf, String senha) {
    final isValid = cpf.trim().isNotEmpty && senha.trim().isNotEmpty;
    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      notifyListeners();
    }
  }

  // Lógica de login (exemplo simples)
  void login({required String cpf, required String senha}) {
    print('Login com CPF: $cpf e Senha: $senha');
    // aqui você chama o repository, faz validações, navega, etc
  }
}
