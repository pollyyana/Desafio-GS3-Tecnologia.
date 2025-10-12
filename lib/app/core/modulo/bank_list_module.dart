import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/modulo/bank_list_page.dart';
import 'package:provider/single_child_widget.dart';

abstract class BankListModule {
  final Map<String, WidgetBuilder> _routers;
  final List<SingleChildWidget>? _bindings;

  BankListModule({
    List<SingleChildWidget>? bindings,
    required Map<String, WidgetBuilder> routers,
  }) : _routers = routers,
       _bindings = bindings;

  // Novo getter público — resolve o erro
  List<SingleChildWidget> get bindings => _bindings ?? [];

  Map<String, WidgetBuilder> get routers {
    return _routers.map(
      (key, pageBuilder) => MapEntry(
        key,
        (_) => BankListPage(
          bindings: _bindings,
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
    throw Exception('Rota não encontrada: $path');
  }
}
