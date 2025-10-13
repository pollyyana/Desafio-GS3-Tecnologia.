import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

import 'login_controller.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(32),
              topRight: Radius.circular(32),
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black12,
                blurRadius: 10,
                offset: Offset(0, -4),
              ),
            ],
          ),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Seja bem-vindo(a)!',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Digite sua senha do aplicativo.',
                  style: TextStyle(fontSize: 14, color: Colors.black54),
                ),
                const SizedBox(height: 24),

                // CPF
                TextFormField(
                  controller: controller.cpfController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    hintText: '000.000.000-00',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe o CPF'),
                    Validatorless.cpf('CPF inválido'),
                  ]),
                ),
                const SizedBox(height: 16),

                // SENHA (sem perder foco!)
                Selector<LoginController, bool>(
                  selector: (_, c) => c.obscurePassword,
                  builder: (_, obscurePassword, __) {
                    return TextFormField(
                      controller: controller.passwordController,
                      keyboardType: TextInputType.number,
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
                          onPressed: controller.togglePasswordVisibility,
                        ),
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(24),
                        ),
                      ),
                      validator: Validatorless.multiple([
                        Validatorless.required('Informe a senha'),
                        Validatorless.min(
                          6,
                          'A senha deve ter pelo menos 6 caracteres',
                        ),
                      ]),
                    );
                  },
                ),

                const SizedBox(height: 24),

                // BOTÃO CONFIRMAR
                Selector<LoginController, bool>(
                  selector: (_, c) => c.isFormValid,
                  builder: (_, isFormValid, __) {
                    return SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: isFormValid
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  controller.login(context);
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: isFormValid
                              ? Colors.blue
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(fontSize: 16, color: Colors.white),
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
