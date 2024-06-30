import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/controller/cadastro_controller.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/widgets/card_cadastro_page.dart';

class CadastroPage extends StatefulWidget {
  final CadastroController controller;

  const CadastroPage({super.key, required this.controller});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Column(
            children: [
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.blue.shade900,
                ),
              ),
              Expanded(
                flex: 2,
                child: Container(
                  color: Colors.white,
                ),
              ),
            ],
          ),
          CardCadastroPage(
            controller: widget.controller,
          ),
        ],
      ),
    );
  }
}
