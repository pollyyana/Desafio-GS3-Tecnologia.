import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';
import 'package:gs3_tecnologia/app/modules/splash/splash_page.dart';

class AppbarWidget extends StatelessWidget {
  final String usuarioNome;

  const AppbarWidget({
    super.key,
    required this.usuarioNome,
  });

  void _abrirLogoutDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (_) => const _LogoutDialog(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            /// Ícone do menu → abre diálogo de logout
            GestureDetector(
              onTap: () => _abrirLogoutDialog(context),
              child: Image.asset(
                ImageConstants.menu,
                width: 22,
                height: 22,
                color: Colors.white,
              ),
            ),

            /// Saudação
            Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: GoogleFonts.mulish(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: usuarioNome,
                    style: GoogleFonts.mulish(
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),

            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Chat clicado!')),
                    );
                  },
                  child: Image.asset(
                    ImageConstants.chat,
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Notificações clicadas!')),
                    );
                  },
                  child: Image.asset(
                    'assets/images/group.png',
                    width: 22,
                    height: 22,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _LogoutDialog extends StatelessWidget {
  const _LogoutDialog();

  @override
  Widget build(BuildContext context) {
    return Dialog(
      backgroundColor: Colors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const SizedBox(height: 12),
            Text(
              'Deseja sair da conta?',
              textAlign: TextAlign.center,
              style: GoogleFonts.mulish(
                fontSize: 18,
                fontWeight: FontWeight.w600,
                color: Colors.black87,
              ),
            ),
            const SizedBox(height: 25),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _BotaoDialog(
                  texto: 'Não',
                  corFundo: Colors.grey[300]!,
                  corTexto: Colors.black87,
                  onPressed: () => Navigator.pop(context),
                ),
                _BotaoDialog(
                  texto: 'Sim',
                  corFundo: Colors.indigo[900]!,
                  corTexto: Colors.white,
                  onPressed: () {
                    Navigator.pop(context);
                    // Redireciona para SplashPage limpando o histórico
                    Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(builder: (_) => const SplashPage()),
                      (route) => false,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BotaoDialog extends StatelessWidget {
  final String texto;
  final Color corFundo;
  final Color corTexto;
  final VoidCallback onPressed;

  const _BotaoDialog({
    required this.texto,
    required this.corFundo,
    required this.corTexto,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        backgroundColor: corFundo,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 10),
      ),
      onPressed: onPressed,
      child: Text(
        texto,
        style: GoogleFonts.mulish(
          fontWeight: FontWeight.w600,
          color: corTexto,
        ),
      ),
    );
  }
}
