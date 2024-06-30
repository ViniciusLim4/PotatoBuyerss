import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class DigitalMediaLogin extends StatelessWidget {
  const DigitalMediaLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          icon: FaIcon(FontAwesomeIcons.google, size: 30, color:  Color(0xFFDB4437),),
          onPressed: () {
            // Adicione a lógica de login com Google aqui
          },
        ),
        SizedBox(width: 16),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.facebook, size: 30, color:  Color(0xFF3b5998)),
          onPressed: () {
            // Adicione a lógica de login com Facebook aqui
          },
        ),
        SizedBox(width: 16),
        IconButton(
          icon: FaIcon(FontAwesomeIcons.twitter, size: 30, color:  Color(0xFF1DA1F2)),
          onPressed: () {
            // Adicione a lógica de login com Twitter aqui
          },
        ),
      ],
    );
  }
}
