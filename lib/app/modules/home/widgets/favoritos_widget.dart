import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';

class FavoritosWidget extends StatelessWidget {
  const FavoritosWidget({super.key});

  Widget _favoritoItem(String imagePath, String label) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          imagePath,
          width: 66,
          height: 66,
          fit: BoxFit.contain,
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: GoogleFonts.mulish(
            fontSize: 10, // tamanho ajustado
            fontWeight: FontWeight.w400, // Regular
            color: Colors.black87,
          ),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        /// Cabeçalho
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              'Meus favoritos',
              style: GoogleFonts.mulish(
                fontWeight: FontWeight.w700, // Bold 700
                fontSize: 16,
                color: Colors.black,
              ),
            ),
            GestureDetector(
              onTap: () => debugPrint('Personalizar clicado'),
              child: Row(
                children: [
                  Text(
                    'Personalizar',
                    style: GoogleFonts.mulish(
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                      color: Colors.blueGrey,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Image.asset(
                    ImageConstants.grid,
                    width: 34,
                    height: 34,
                  ),
                ],
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        /// Lista horizontal
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          padding: const EdgeInsets.symmetric(horizontal: 12),
          child: Row(
            children: [
              _favoritoItem(ImageConstants.virtual, 'Cartão virtual'),
              const SizedBox(width: 35),
              _favoritoItem(ImageConstants.adicional, 'Cartão adicional'),
              const SizedBox(width: 35),
              _favoritoItem(ImageConstants.seguro, 'Seguros'),
              const SizedBox(width: 35),
              _favoritoItem(ImageConstants.sms, 'Pacotes'),
              const SizedBox(width: 35),
              _favoritoItem(ImageConstants.vip, 'Área VIP'),
            ],
          ),
        ),
      ],
    );
  }
}
