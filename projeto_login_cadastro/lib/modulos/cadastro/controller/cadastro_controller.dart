import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/bloc/cadastro_bloc.dart';

class CadastroController {
  final CadastroBloc cadastroBloc;

  CadastroController({required this.cadastroBloc});

  Future<User?> login({
    required GlobalKey<FormState> cadastroKey,
  }) async {
    User? user;

    if (cadastroKey.currentState!.validate()) {
      cadastroKey.currentState!.save();

      //loginBloc?.logIn(loginModel!);
    }
    return user;
  }
}
