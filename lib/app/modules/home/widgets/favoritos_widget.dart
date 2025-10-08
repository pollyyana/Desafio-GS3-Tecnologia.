import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';

class FavoritosWidget extends StatelessWidget {
  //refatorar
  const FavoritosWidget({super.key});

  Widget iconFavorito({
    String? imagePath,
    IconData? icon,
  }) {
    if (imagePath != null) {
      return Image.asset(
        imagePath,
        width: 86,
        height: 86,
        fit: BoxFit.contain,
      );
    } else if (icon != null) {
      return Icon(icon, size: 32, color: ColorsConstants.azulGradient);
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _favoritoItem(
    String? imagePath,
    String label, {
    IconData? icon,
  }) {
    Widget iconWidget;

    if (imagePath != null) {
      // Padrão para os que usam imagem
      iconWidget = Image.asset(
        imagePath,
        width: 66,
        height: 66,
        fit: BoxFit.contain,
      );
    } else if (icon != null) {
      // Padroniza ícones (ex: "Pacotes")
      iconWidget = Container(
        width: 66,
        height: 66,
        decoration: BoxDecoration(
          color: ColorsConstants.icongrey,
          borderRadius: BorderRadius.circular(16),
        ),
        child: Center(
          child: Icon(
            icon,
            size: 32,
            color: ColorsConstants.azulGradient,
          ),
        ),
      );
    } else {
      iconWidget = const SizedBox.shrink();
    }

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        iconWidget,
        const SizedBox(height: 8),
        Text(
          label,
          style: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.w400,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double spacing;

        if (constraints.maxWidth >= 1200) {
          spacing = 20;
        } else if (constraints.maxWidth >= 800) {
          spacing = 16;
        } else {
          spacing = 16;
        }

        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Cabeçalho
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  'Meus favoritos',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                GestureDetector(
                  onTap: () => print('Menu clicado'),
                  child: Row(
                    children: [
                      const Text(
                        'Personalizar',
                        style: TextStyle(color: Colors.blue),
                      ),
                      const SizedBox(width: 8),
                      Image.asset(
                        'assets/images/menu.png',
                        color: ColorsConstants.azul,
                        width: 24,
                        height: 24,
                      ),
                    ],
                  ),
                ),
              ],
            ),
            const SizedBox(height: 16),
            // Lista horizontal
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              padding: const EdgeInsets.symmetric(horizontal: 19),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  _favoritoItem(ImageConstants.icon, 'Cartão virtual'),
                  SizedBox(width: spacing),
                  _favoritoItem(ImageConstants.iconOne, 'Cartão adicional'),
                  SizedBox(width: spacing),
                  _favoritoItem(ImageConstants.iconotwo, 'Seguros'),
                  SizedBox(width: spacing),
                  _favoritoItem(
                    null,
                    'Pacotes',
                    icon: Icons.card_giftcard_sharp,
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
