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

    final bool isGreen = widget.cartao.id == 2;
    final Color backgroundColor = isGreen
        ? const Color.fromRGBO(0, 81, 83, 1)
        : ColorsConstants.azul;
    final Color textColor = Colors.white;

    return Container(
      width: 300,
      height: 180,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          //nome e olho
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.cartao.bankName,
                style: TextStyle(
                  color: textColor,
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    _mostrarLimite = !_mostrarLimite;
                  });
                  if (widget.cartao.onEyePressed != null) {
                    widget.cartao.onEyePressed!();
                  }
                },
                child: Image.asset(
                  _mostrarLimite ? ImageConstants.eyeOn : ImageConstants.eyeOff,
                  width: 24,
                  height: 24,
                  color: Colors.white,
                ),
              ),
            ],
          ),
          const SizedBox(height: 16),

          // 🔹 Limite disponível
          Text(
            'Limite disponível',
            style: TextStyle(
              color: textColor.withValues(alpha: 0.8),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 4),
          Text(
            _mostrarLimite
                ? currency.format(widget.cartao.availableLimit)
                : '••••••',
            style: TextStyle(
              color: textColor,
              fontSize: 22,
              fontWeight: FontWeight.bold,
            ),
          ),
          const Spacer(),

          // dia compra
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: 88,
                height: 56,
                decoration: BoxDecoration(
                  color: Colors.white.withValues(alpha: 0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
                alignment: Alignment.center,
                child: Text(
                  '**** ${widget.cartao.lastDigits}',
                  style: TextStyle(
                    color: textColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    'Melhor dia de compra',
                    style: TextStyle(
                      color: textColor.withValues(alpha: 0.8),
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${widget.cartao.bestPurchaseDay}',
                    style: TextStyle(
                      color: textColor,
                      fontSize: 16,
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
