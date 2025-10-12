import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/models/fatura_model.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_controller.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

class FaturaButtonWidget extends StatelessWidget {
  final dateFormat = DateFormat('dd/MM/y');
  FaturaButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(30),
      splashColor: Colors.blue.withOpacity(0.2),
      onTap: () async {
        final faturaController = context.read<FaturaController>();
        final cartaoController = context.read<CartaoController>();

        final selectedDate = await showDatePicker(
          context: context,
          initialDate: DateTime.now(),
          firstDate: DateTime(2020),
          lastDate: DateTime(2100),
        );

        if (selectedDate != null) {
          final cartaoSelecionado = cartaoController.cartaoSelecionado;

          if (cartaoSelecionado == null) {
            if (!context.mounted) return;
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Nenhum cartão selecionado!')),
            );
            return;
          }

          final novaFatura = FaturaModel(
            title: 'Nova compra',
            amount: 123.45,
            date: selectedDate,
            parcelas: 1,
          );

          await faturaController.adicionarFatura(
            novaFatura,
            cartaoSelecionado.id,
          );

          if (!context.mounted) return;
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(
              backgroundColor: Colors.green.shade600,
              content: const Text('Fatura adicionada com sucesso!'),
              behavior: SnackBarBehavior.floating,
            ),
          );
        }
      },
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.blueAccent),
          color: Colors.blueAccent.withOpacity(0.08),
          borderRadius: BorderRadius.circular(30),
        ),
        child: const Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(Icons.add, color: Colors.blueAccent),
            SizedBox(width: 8),
            Text(
              'Adicionar Fatura',
              style: TextStyle(
                color: Colors.blueAccent,
                fontWeight: FontWeight.w600,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
