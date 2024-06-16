import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/controller/cadastro_controller.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/widgets/card_cadastro_page.dart';
import 'package:projeto_login_cadastro/shared/app_colors/app_colors.dart';

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
        alignment: Alignment.bottomCenter,
        children: [
          Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(100),
                    ),
                    gradient: AppGradients.primaryGradient,
                  ),
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
          Padding(
            padding: const EdgeInsets.only(top: 100),
            child: CardCadastroPage(
              controller: widget.controller,
            ),
          ),
        ],
      ),
    );
  }
}
