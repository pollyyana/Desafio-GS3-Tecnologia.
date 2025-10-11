// encapsulando a rota '
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider/single_child_widget.dart';

//encapsulando rotas do AuthModule por exemplo
class BankListPage extends StatelessWidget {
  final List<SingleChildWidget>? _bindings;
  final WidgetBuilder _page;

  const BankListPage({
    super.key,
    List<SingleChildWidget>? bindings,
    required WidgetBuilder page,
  }) : _bindings = bindings,
       _page = page;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      // se bindings nao for nulo ele adiciona um Provider fake
      providers: _bindings ?? [Provider(create: (_) => Object())],
      child: Builder(
        builder: (context) => _page(context),
      ),
    );
  }
}
