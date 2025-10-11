import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/modules/home/home_page.dart';
import 'package:gs3_tecnologia/app/services/login_service.dart';

class LoginController extends ChangeNotifier {
  final LoginService _loginService;

  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  LoginController({required LoginService loginService})
    : _loginService = loginService {
    cpfController.addListener(_validateForm);
    passwordController.addListener(_validateForm);
  }

  void togglePasswordVisibility() {
    _obscurePassword = !_obscurePassword;
    notifyListeners();
  }

  void _validateForm() {
    final cpf = cpfController.text.trim();
    final password = passwordController.text.trim();
    final isValid = cpf.isNotEmpty && password.isNotEmpty;

    if (_isFormValid != isValid) {
      _isFormValid = isValid;
      notifyListeners();
    }
  }

  Future<void> login(BuildContext context) async {
    final cpf = cpfController.text.trim();
    final password = passwordController.text.trim();

    final user = await _loginService.login(cpf, password);

    if (user != null) {
      // login bem-sucedido: navega para HomePage
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: (_) => const HomePage()),
      );
    } else {
      // login falhou: exibe mensagem
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('CPF ou senha incorretos')),
      );
    }
  }

  @override
  void dispose() {
    cpfController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
