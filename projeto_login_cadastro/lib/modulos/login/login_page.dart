// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/widgets/card_login_widget.dart';

class LoginPage extends StatelessWidget {
  final LoginController controller;
  const LoginPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color(0xff080926), Color(0xffffffff)],
            stops: [0, 1],
            begin: Alignment(-1.9, 0.4),
            end: Alignment.center,
          ),
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
