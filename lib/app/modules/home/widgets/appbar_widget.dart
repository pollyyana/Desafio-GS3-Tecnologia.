import 'package:flutter/material.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  void _onMenuPressed(BuildContext context) {
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(10, 60, 0, 0), // ajusta posição do menu
      items: [
        PopupMenuItem(
          value: 'logout',
          child: Text('Logout'),
        ),
      ],
    ).then((value) {
      if (value == 'logout') {
        // ação de logout
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Logout clicado!')),
        );
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
        top: MediaQuery.of(context).padding.top,
        left: 16,
        right: 10,
        bottom: 10,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // Ícone de menu clicável
          GestureDetector(
            onTap: () => _onMenuPressed(context),
            child: Image.asset(
              'assets/images/menu.png', // troque pelo caminho da sua imagem
              width: 24,
              height: 24,
            ),
          ),

          // Texto central
          const Text(
            'Olá, Cliente',
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),

          // Ícones do lado direito
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  // ação de notificações
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Notificações clicadas!')),
                  );
                },
                child: Image.asset(
                  'assets/images/chat2.png',
                  width: 24,
                  height: 24,
                ),
              ),
              const SizedBox(width: 12),
              GestureDetector(
                onTap: () {
                  // ação do perfil
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Perfil clicado!')),
                  );
                },
                child: Image.asset(
                  'assets/images/group.png',
                  width: 24,
                  height: 24,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
