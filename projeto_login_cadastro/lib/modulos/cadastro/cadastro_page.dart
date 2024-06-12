import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/widgets/card_cadastro_page.dart';

class CadastroPage extends StatefulWidget {
  const CadastroPage({super.key});

  @override
  State<CadastroPage> createState() => _CadastroPageState();
}

class _CadastroPageState extends State<CadastroPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff7f7fd5), Color(0xff86a8e7), Color(0xff91eae4)],
            stops: [0, 0.5, 1],
            begin: Alignment(-1.2, 1.2),
            end: Alignment(1.1, -1.2),
          ),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CardCadastroPage(),
            ],
          ),
        ),
      ),
    );
  }
}
