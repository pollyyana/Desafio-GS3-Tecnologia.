import 'package:flutter/material.dart';
import 'package:validatorless/validatorless.dart';

class TextFieldInput extends StatelessWidget {
  final TextEditingController controller;
  final bool obscurePassword;
  final VoidCallback togglePasswordVisibility;

  const TextFieldInput({
    super.key,
    required this.controller,
    required this.obscurePassword,
    required this.togglePasswordVisibility,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      obscureText: obscurePassword,
      decoration: InputDecoration(
        labelText: 'Senha',
        hintText: 'Senha',
        suffixIcon: IconButton(
          icon: Icon(
            obscurePassword
                ? Icons.visibility_off_outlined
                : Icons.visibility_outlined,
          ),
          onPressed: togglePasswordVisibility,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(24),
        ),
      ),
      validator: Validatorless.multiple([
        Validatorless.required('Informe a senha'),
        Validatorless.min(6, 'A senha deve ter pelo menos 6 caracteres'),
      ]),
    );
  }
}
