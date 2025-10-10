import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:intl/intl.dart';

class CartaoBankWidget extends StatefulWidget {
  final CartaoModel cartao;
  const CartaoBankWidget({super.key, required this.cartao});

  @override
  State<CartaoBankWidget> createState() => _CartaoBankWidgetState();
}

class _CartaoBankWidgetState extends State<CartaoBankWidget> {
  bool _mostrarLimite = true;

  @override
  Widget build(BuildContext context) {
    final currency = NumberFormat.simpleCurrency(locale: 'pt_BR');

    return Container(
      width: 300,
      decoration: BoxDecoration(
        color: widget.cartao.id.isEven
            ? const Color.fromRGBO(0, 81, 83, 1) // Verde
            : const Color(0xFF004D99), // Azul
        borderRadius: BorderRadius.circular(14),
      ),
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Parte superior (logo + número + olho)
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Logo quadrado
              Container(
                width: 88,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(4),
                ),
              ),
              const SizedBox(width: 12),
              // Dígitos + nome
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '•••• 5621',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16,
                      letterSpacing: 1.5,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    widget.cartao.bankName,
                    style: const TextStyle(
                      color: Colors.white70,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              const Spacer(),
              // Ícone de olho
              GestureDetector(
                onTap: () {
                  setState(() => _mostrarLimite = !_mostrarLimite);
                },
                child: Image.asset(
                  _mostrarLimite ? ImageConstants.eyeOn : ImageConstants.eyeOff,
                  width: 20,
                  height: 20,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12),

          // Linha divisória
          Container(
            height: 1,
            color: Colors.white.withValues(alpha: 0.4),
          ),
          const SizedBox(height: 12),

          // Parte inferior (limite e melhor dia)
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // Limite disponível
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Limite disponível',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    _mostrarLimite
                        ? currency.format(widget.cartao.availableLimit)
                        : '••••••••',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),

              // Melhor dia de compra
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Text(
                    'Melhor dia de compra',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 11,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${widget.cartao.bestPurchaseDay}',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
