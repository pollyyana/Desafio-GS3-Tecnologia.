import 'package:flutter/material.dart';
import 'package:gs3_tecnologia/app/core/utils/constants.dart';

class AppbarWidget extends StatelessWidget {
  const AppbarWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      bottom: false,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            GestureDetector(
              child: Image.asset(
                ImageConstants.menu,
                width: 22,
                height: 22,
                color: Colors.white,
              ),
            ),
            const Text.rich(
              TextSpan(
                text: 'Olá, ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w400,
                  color: Colors.white,
                ),
                children: [
                  TextSpan(
                    text: 'Cliente',
                    style: TextStyle(
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
