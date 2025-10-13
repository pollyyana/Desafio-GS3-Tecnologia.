import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:intl/intl.dart';

/// Contém todos os widgets reutilizáveis do módulo de Cartões.
class CartaoWidgets {
  /// Widget principal do cartão.
  static Widget buildCartao({
    required CartaoModel cartao,
    required bool mostrarLimite,
    required NumberFormat currency,
    required VoidCallback onToggleVisibilidade,
  }) {
    return Container(
      height: 160,
      width: 300,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: cartao.id.isEven
              ? const [Color(0xFF005153), Color(0xFF005153)] // verde
              : const [Color(0xFF2B66BC), Color(0xFF132D55)], // azul
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _topoCartao(cartao, mostrarLimite, onToggleVisibilidade),
          const Spacer(),
          const Divider(color: Colors.white24, height: 1, thickness: 0.5),
          const SizedBox(height: 8),
          _infoLimiteEMelhorDia(cartao, mostrarLimite, currency),
        ],
      ),
    );
  }

  // --- Cabeçalho do cartão ---
  static Widget _topoCartao(
    CartaoModel cartao,
    bool mostrarLimite,
    VoidCallback onToggle,
  ) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        _logoCartao(),
        const SizedBox(width: 15),
        _infoCartao(cartao.bankName),
        const Spacer(),
        _botaoOlho(mostrarLimite, onToggle),
      ],
    );
  }

  static Widget _logoCartao() {
    return Container(
      width: 100,
      height: 65,
      decoration: BoxDecoration(
        color: Colors.grey.shade300,
        borderRadius: BorderRadius.circular(1),
      ),
    );
  }

  static Widget _infoCartao(String bankName) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text(
          '•••• 5621',
          style: TextStyle(
            color: Colors.white,
            fontSize: 14,
            letterSpacing: 1.5,
            fontWeight: FontWeight.w600,
          ),
        ),
        const SizedBox(height: 4),
        Text(
          bankName,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w500,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  static Widget _botaoOlho(bool mostrar, VoidCallback onTap) {
    return GestureDetector(
      onTap: onTap,
      child: Image.asset(
        mostrar ? ImageConstants.eyeOn : ImageConstants.eyeOff,
        width: 22,
        height: 22,
        color: Colors.white,
      ),
    );
  }

  // --- Infos de limite e melhor dia ---
  static Widget _infoLimiteEMelhorDia(
    CartaoModel cartao,
    bool mostrarLimite,
    NumberFormat currency,
  ) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        _textoInfo(
          'Limite disponível',
          mostrarLimite ? currency.format(cartao.availableLimit) : '••••••',
          alinhamento: CrossAxisAlignment.start,
        ),
        _textoInfo(
          'Melhor dia de compra',
          '${cartao.bestPurchaseDay}',
          alinhamento: CrossAxisAlignment.end,
        ),
      ],
    );
  }

  static Widget _textoInfo(
    String titulo,
    String valor, {
    CrossAxisAlignment alinhamento = CrossAxisAlignment.start,
  }) {
    const smallLabel = TextStyle(
      color: Colors.white70,
      fontSize: 11,
      fontWeight: FontWeight.w400,
    );

    const valueStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 18,
    );

    return Column(
      crossAxisAlignment: alinhamento,
      children: [
        Text(titulo, style: smallLabel),
        const SizedBox(height: 4),
        SizedBox(
          height: 25,
          child: Text(valor, style: valueStyle),
        ),
      ],
    );
  }
}
