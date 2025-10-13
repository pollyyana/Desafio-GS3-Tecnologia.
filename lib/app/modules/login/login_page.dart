import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/theme/todo_list_ui_config.dart';
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
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Digite sua senha do aplicativo.',
                  style: TextStyle(
                    fontSize: 14,
                    color: AppColors.textGrey,
                  ),
                ),
                const SizedBox(height: 24),

                // CPF
                TextFormField(
                  controller: controller.cpfController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'CPF',
                    hintText: '000.000.000-00',
                    labelStyle: const TextStyle(color: AppColors.textGrey),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(24),
                    ),
                    enabledBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: AppColors.borderGrey),
                    ),
                    focusedBorder: const OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(24)),
                      borderSide: BorderSide(color: AppColors.borderGrey),
                    ),
                  ),
                  validator: Validatorless.multiple([
                    Validatorless.required('Informe o CPF'),
                    Validatorless.cpf('CPF inválido'),
                  ]),
                ),
                const SizedBox(height: 16),

                // SENHA
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
                        labelStyle: const TextStyle(color: AppColors.textGrey),
                        suffixIcon: IconButton(
                          icon: Icon(
                            obscurePassword
                                ? Icons.visibility_off_outlined
                                : Icons.visibility_outlined,
                            color: AppColors.borderGrey,
                          ),
                          onPressed: controller.togglePasswordVisibility,
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderSide: BorderSide(color: AppColors.borderGrey),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(24)),
                          borderSide: BorderSide(color: AppColors.borderGrey),
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
                              ? AppColors.primary
                              : AppColors.borderGrey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: const Text(
                          'Confirmar',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                          ),
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
