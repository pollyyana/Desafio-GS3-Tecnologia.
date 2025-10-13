import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
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
  bool mostrarLimite = true;

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      if (!mounted) return;

      final cartaoController = context.read<CartaoController>();
      final faturaController = context.read<FaturaController>();

      await cartaoController.fetchCartoes();

      if (cartaoController.cartoes.isNotEmpty) {
        final primeiroCartao = cartaoController.cartoes.first;
        cartaoController.selecionarCartao(primeiroCartao);
        faturaController.carregarFaturas(primeiroCartao.id);
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
              height: 160,
              child: PageView.builder(
                controller: _pageController,
                onPageChanged: (index) {
                  final cartaoSelecionado = controller.cartoes[index];
                  controller.selecionarCartao(cartaoSelecionado);

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
                    child: _buildCartao(cartao, index),
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

  Widget _buildCartao(CartaoModel cartao, int index) {
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

    final coresGradiente = [
      const [Color(0xFF2B66BC), Color(0xFF132D55)], // azul
      const [Color(0xFF005153), Color(0xFF005153)], // verde
    ];

    final gradientColors = coresGradiente[index % coresGradiente.length];

    return Container(
      height: 160,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: gradientColors,
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
                  width: 100,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.grey[300],
                    borderRadius: BorderRadius.circular(1),
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
                        fontSize: 14,
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
                GestureDetector(
                  onTap: () {
                    setState(() {
                      mostrarLimite = !mostrarLimite;
                    });
                  },
                  child: Image.asset(
                    mostrarLimite
                        ? ImageConstants.eyeOn
                        : ImageConstants.eyeOff,
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  ),
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
                        mostrarLimite
                            ? 'R\$ ${cartao.limitValue.toStringAsFixed(2).replaceAll('.', ',')}'
                            : '••••••',
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
