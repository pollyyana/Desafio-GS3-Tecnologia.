import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/widgets/constants.dart';

class FavoritosResponsive extends StatelessWidget {
  const FavoritosResponsive({super.key});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth >= 1200) {
          return const _DesktopFavoritosView();
        } else if (constraints.maxWidth >= 800) {
          return const _TabletFavoritosView();
        } else {
          return const _MobileFavoritosView();
        }
      },
    );
  }
}

// ------------------- DESKTOP -------------------
class _DesktopFavoritosView extends StatelessWidget {
  const _DesktopFavoritosView({super.key});

  @override
  Widget build(BuildContext context) {
    // Layout mais largo, pode aumentar tamanho do container
    final double containerSize = 100;

    return Padding(
      padding: const EdgeInsets.all(20),
      child: Row(
        children: [
          _favoritoItem(ImageConstants.icon, 'Cartão virtual'),
          const SizedBox(width: 20),
          _favoritoItem(ImageConstants.iconOne, 'Cartão adicional'),
          const SizedBox(width: 20),
          _favoritoItem(ImageConstants.iconotwo, 'Seguros'),
          const SizedBox(width: 20),
          _favoritoItem(
            null,
            'Pacotes',
            icon: Icons.card_giftcard_sharp,
            useContainer: true,
            containerSize: containerSize,
          ),
        ],
      ),
    );
  }
}

// ------------------- TABLET -------------------
class _TabletFavoritosView extends StatelessWidget {
  const _TabletFavoritosView({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerSize = 90;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              _favoritoItem(ImageConstants.icon, 'Cartão virtual'),
              const SizedBox(width: 16),
              _favoritoItem(ImageConstants.iconOne, 'Cartão adicional'),
            ],
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _favoritoItem(ImageConstants.iconotwo, 'Seguros'),
              const SizedBox(width: 16),
              _favoritoItem(
                null,
                'Pacotes',
                icon: Icons.card_giftcard_sharp,
                useContainer: true,
                containerSize: containerSize,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

// ------------------- MOBILE -------------------
class _MobileFavoritosView extends StatelessWidget {
  const _MobileFavoritosView({super.key});

  @override
  Widget build(BuildContext context) {
    final double containerSize = 80;

    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: Row(
        children: [
          _favoritoItem(ImageConstants.icon, 'Cartão virtual'),
          const SizedBox(width: 16),
          _favoritoItem(ImageConstants.iconOne, 'Cartão adicional'),
          const SizedBox(width: 16),
          _favoritoItem(ImageConstants.iconotwo, 'Seguros'),
          const SizedBox(width: 16),
          _favoritoItem(
            null,
            'Pacotes',
            icon: Icons.card_giftcard_sharp,
            useContainer: true,
            containerSize: containerSize,
          ),
        ],
      ),
    );
  }
}

// ------------------- FUNÇÃO PARA PADRONIZAR ITEM -------------------
Widget _favoritoItem(
  String? imagePath,
  String label, {
  IconData? icon,
  bool useContainer = false,
  double containerSize = 100,
}) {
  Widget iconWidget;

  if (imagePath != null) {
    iconWidget = Image.asset(
      imagePath,
      width: 66,
      height: 66,
      fit: BoxFit.contain,
    );
  } else if (icon != null) {
    iconWidget = ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
        colors: [
          ColorsConstants.azulGradient,
          ColorsConstants.azulGradient.withOpacity(0.7),
        ],
        begin: Alignment.topLeft,
        end: Alignment.bottomRight,
      ).createShader(bounds),
      child: Icon(icon, size: 40, color: Colors.white),
    );
  } else {
    iconWidget = const SizedBox.shrink();
  }

  if (useContainer) {
    iconWidget = Container(
      height: containerSize,
      width: containerSize,
      decoration: BoxDecoration(
        color: ColorsConstants.icongrey,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Center(child: iconWidget),
    );
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
