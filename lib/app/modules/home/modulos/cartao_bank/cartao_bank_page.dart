import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/models/cartao_model.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/cartao_bank/cartao_controller.dart';
import 'package:gs3_tecnologia/app/modules/home/modulos/fatura/fatura_controller.dart';
import 'package:provider/provider.dart';

class CartaoBankPage extends StatefulWidget {
  const CartaoBankPage({super.key});

  @override
  State<CartaoBankPage> createState() => _CartaoBankPageState();
}

class _CartaoBankPageState extends State<CartaoBankPage> {
  final PageController _pageController = PageController(viewportFraction: 0.93);

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      final cartaoController = context.read<CartaoController>();
      final faturaController = context.read<FaturaController>();

      await cartaoController.fetchCartoes();

      // Seleciona o primeiro cartão e carrega as faturas correspondentes
      if (cartaoController.cartoes.isNotEmpty) {
        final primeiroCartao = cartaoController.cartoes.first;
        cartaoController.selecionarCartao(primeiroCartao);
        faturaController.carregarFaturas(primeiroCartao.id);

        debugPrint(
          'Cartão inicial selecionado: ${primeiroCartao.name} (id ${primeiroCartao.id})',
        );
      }
    });
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<CartaoController>(
      builder: (context, controller, child) {
        if (controller.isLoading) {
          return const Center(child: CircularProgressIndicator());
        }

        if (controller.cartoes.isEmpty) {
          return const Center(child: Text('Nenhum cartão cadastrado.'));
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 190,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  final cartaoSelecionado = controller.cartoes[index];
                  controller.selecionarCartao(cartaoSelecionado);

                  debugPrint(
                    'Cartão selecionado: ${cartaoSelecionado.name} (id ${cartaoSelecionado.id})',
                  );

                  // Atualiza faturas do cartão selecionado
                  final faturaController = context.read<FaturaController>();
                  faturaController.carregarFaturas(cartaoSelecionado.id);
                },
                itemCount: controller.cartoes.length,
                padEnds: false,
                itemBuilder: (context, index) {
                  final cartao = controller.cartoes[index];
                  return Padding(
                    padding: EdgeInsets.only(
                      left: index == 0 ? 6 : 0,
                      right: index == controller.cartoes.length - 1 ? 6 : 10,
                    ),
                    child: _buildCartao(cartao),
                  );
                },
              ),
            ),
            const SizedBox(height: 12),
          ],
        );
      },
    );
  }

  Widget _buildCartao(CartaoModel cartao) {
    const smallLabel = TextStyle(
      color: Colors.white70,
      fontSize: 12,
      fontWeight: FontWeight.w400,
    );

    const valueStyle = TextStyle(
      color: Colors.white,
      fontWeight: FontWeight.bold,
      fontSize: 22,
    );

    const iconColor = Color(0xFF90C1FF);

    return Container(
      height: 190,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: const LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [Color(0xFF2055B8), Color(0xFF143F9A)],
        ),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.20),
            blurRadius: 12,
            offset: const Offset(0, 6),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 16, 16, 12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- Cabeçalho ---
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  width: 110,
                  height: 75,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
                const SizedBox(width: 15),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '•••• ${cartao.digitos}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        letterSpacing: 1.5,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 4),
                    Text(
                      cartao.name,
                      style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w500,
                        fontSize: 16,
                      ),
                    ),
                  ],
                ),
                const Spacer(),
                const Icon(
                  Icons.remove_red_eye_outlined,
                  color: iconColor,
                  size: 22,
                ),
              ],
            ),

            const Spacer(),
            const Divider(color: Colors.white24, height: 1, thickness: 0.5),
            const SizedBox(height: 8),

            // --- Infos de limite e fatura ---
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Limite disponível', style: smallLabel),
                    SizedBox(
                      height: 25,
                      child: Text(
                        'R\$ ${cartao.limitValue.toStringAsFixed(2).replaceAll('.', ',')}',
                        style: valueStyle,
                      ),
                    ),
                  ],
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    const Text('Melhor dia de compra', style: smallLabel),
                    SizedBox(
                      height: 25,
                      child: Text('${cartao.day}', style: valueStyle),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
