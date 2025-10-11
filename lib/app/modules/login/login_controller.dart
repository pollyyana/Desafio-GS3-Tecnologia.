import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/services/user_service.dart';

class LoginController extends ChangeNotifier {
  final UserService _userService;

  final cpfController = TextEditingController();
  final senhaController = TextEditingController();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  LoginController(this._userService) {
    cpfController.addListener(_validateForm);
    senhaController.addListener(_validateForm);
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void _validateForm() {
    final cpf = cpfController.text.trim();
    final senha = senhaController.text.trim();
    final isValid = cpf.isNotEmpty && senha.isNotEmpty;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      notifyListeners();
    }
  }

  Future<bool> login() async {
    final cpf = cpfController.text.trim();
    final senha = senhaController.text.trim();

    final user = await _userService.login(cpf, senha);
    return user != null;
  }

  @override
  void dispose() {
    cpfController.dispose();
    senhaController.dispose();
    super.dispose();
  }
}
