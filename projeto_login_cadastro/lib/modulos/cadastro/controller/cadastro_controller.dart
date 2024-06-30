import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/bloc/cadastro_bloc.dart';

class CadastroController {
  final CadastroBloc cadastroBloc;
  final RegisterModel registerModel;

  CadastroController({required this.cadastroBloc, required this.registerModel});

  Future<User?> register({
    required GlobalKey<FormState> cadastroKey,
  }) async {
    User? user;

    if (cadastroKey.currentState!.validate()) {
      cadastroKey.currentState!.save();

      cadastroBloc?.register(registerModel: registerModel);
    }
    return user;
  }
}
