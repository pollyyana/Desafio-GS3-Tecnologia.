import 'package:flutter/material.dart';

extension ContextUtils on BuildContext {
  // Tamanhos personalizados com porcentagem
  double width(double percent) => MediaQuery.of(this).size.width * percent;
  double height(double percent) => MediaQuery.of(this).size.height * percent;

  // Estilo de texto com override fácil
  TextStyle textStyle({
    double? size,
    FontWeight? weight,
    Color? color,
  }) {
    return Theme.of(this).textTheme.bodyMedium!.copyWith(
      fontSize: size,
      fontWeight: weight,
      color: color,
    );
  }
}

//colinha
/*
🔹 Exemplo de texto estilizado:
Text(
  'Bem-vindo!',
  style: context.textStyle(
    size: 20,
    weight: FontWeight.bold,
    color: Colors.black87,
  ),
);

🔹 Espaçamento vertical de 24px:
context.spaceY(24)

🔹 Padding horizontal de 16 e vertical de 12:
padding: context.padding(h: 16, v: 12)

🔹 Altura com 30% da tela:
context.height(0.3)

🔹 Largura com 50% da tela:
context.width(0.5)

🔹 Acessando cor primária do tema:
context.primary

🔹 Cor personalizada:
context.color(Colors.redAccent)
*/
