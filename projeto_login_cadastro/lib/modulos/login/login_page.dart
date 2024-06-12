// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/widgets/card_login_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({
    super.key,
    required this.controller,
  });

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
        )
      ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CardLoginWidget(
                controller: controller,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
