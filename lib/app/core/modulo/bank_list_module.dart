import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/modulo/bank_list_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class BankListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  //construtor
  BankListModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  }) : _routers = routers,
       _bindings = bindings;

  //todoListPage login page foi encapsulado encima do todo..
  Map<String, WidgetBuilder> get routers {
    // Cria um novo mapa de rotas, onde cada rota será exibida dentro de um BankListPage
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key, // mantém a mesma chave (nome da rota)
        // substitui a página original por uma função que retorna um BankListPage
        (_) => BankListPage(
          // injeta as dependências necessárias
          bindings: _bindings,
          // define a página real que será exibida dentro do layout padrão
          page: pageBuilder,
        ),
      ),
    );
  }

  Widget getPage(String path, BuildContext context) {
    final widgetBuilder = _routers[path];
    if (widgetBuilder != null) {
      return BankListPage(
        page: widgetBuilder,
        bindings: _bindings,
      );
    }
    throw Exception();
  }
}
