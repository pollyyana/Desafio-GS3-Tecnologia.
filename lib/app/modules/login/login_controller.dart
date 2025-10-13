import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/modules/home/home_page.dart';
import 'package:gs3_tecnologia/app/services/login/login_service.dart';

class LoginController extends ChangeNotifier {
  final LoginService _loginService;

  final cpfController = TextEditingController();
  final passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool get obscurePassword => _obscurePassword;

  bool _isFormValid = false;
  bool get isFormValid => _isFormValid;

  String? _usuarioNome;
  String? get usuarioNome => _usuarioNome;

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
    FocusScope.of(context).unfocus(); // fecha o teclado

    final cpf = cpfController.text.trim();
    final password = passwordController.text.trim();

    try {
      final user = await _loginService.login(cpf, password);

      if (!context.mounted) return;

      if (user != null) {
        _usuarioNome = user.name;
        notifyListeners();

        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (_) => HomePage(
              usuarioNome: _usuarioNome,
            ),
          ),
        );
      } else {
        _mostrarMensagem(context, 'CPF ou senha incorretos.');
      }
    } catch (e) {
      if (context.mounted) {
        _mostrarMensagem(context, e.toString().replaceAll('Exception: ', ''));
      }
    }
  }

  /// Método helper para exibir mensagens com segurança
  void _mostrarMensagem(BuildContext context, String mensagem) {
    ScaffoldMessenger.of(context)
      ..hideCurrentSnackBar()
      ..showSnackBar(
        SnackBar(
          content: Text(
            mensagem,
            style: const TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.redAccent,
          behavior: SnackBarBehavior.floating,
          margin: const EdgeInsets.all(12),
        ),
      );
  }

  @override
  void dispose() {
    cpfController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
