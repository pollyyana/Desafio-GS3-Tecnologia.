import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/theme/theme_extension.dart';
import 'package:gs3_tecnologia/app/core/theme/todo_list_ui_config.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/login/login_controller.dart';
import 'package:provider/provider.dart';
import 'package:validatorless/validatorless.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = context.read<LoginController>();

    final formKey = GlobalKey<FormState>();
    final cpfController = TextEditingController();
    final senhaController = TextEditingController();

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
            child: Consumer<LoginController>(
              builder: (context, controller, _) {
                return Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Seja bem-vindo(a)!',
                      style: context.mulishBold.copyWith(
                        fontSize: 16,
                        color: Colors.black87,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      'Digite sua senha do aplicativo.',
                      style: context.manropeRegular.copyWith(
                        fontSize: 16,
                        // weight:
                        color: Colors.black54,
                      ),
                    ),
                    const SizedBox(height: 24),
                    TextFormField(
                      controller: cpfController,
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
                      onChanged: (_) => controller.checkFormValidity(
                        cpfController.text,
                        senhaController.text,
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Campo Senha
                    TextFormField(
                      controller: senhaController,
                      obscureText: controller.obscurePassword,
                      decoration: InputDecoration(
                        labelText: 'Senha',
                        hintText: 'Senha',
                        suffixIcon: IconButton(
                          icon: Icon(
                            controller.obscurePassword
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
                      onChanged: (_) => controller.checkFormValidity(
                        cpfController.text,
                        senhaController.text,
                      ),
                    ),
                    const SizedBox(height: 24),
                    SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: ElevatedButton(
                        onPressed: controller.isFormValid
                            ? () {
                                if (formKey.currentState!.validate()) {
                                  controller.login(
                                    cpf: cpfController.text,
                                    senha: senhaController.text,
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: controller.isFormValid
                              ? ColorsConstants.azulGradient
                              : Colors.grey,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                          elevation: 4,
                        ),
                        child: Text(
                          'Confirmar',
                          style: context.textStyle(
                            size: 16,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
