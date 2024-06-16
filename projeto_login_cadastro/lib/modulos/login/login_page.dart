// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/widgets/card_login_widget.dart';
import 'package:projeto_login_cadastro/shared/app_colors/app_colors.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({
    super.key,
    required this.controller,
  });

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
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(100),
                      ),
                      gradient: AppGradients.primaryGradient),
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
          Container(
            constraints: const BoxConstraints(maxHeight: 400),
            child: Center(
              child: CardLoginWidget(
                controller: controller,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
