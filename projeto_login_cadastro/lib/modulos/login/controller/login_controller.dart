import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';

class LoginController {
  final LoginBloc? loginBloc;
  final LoginModel loginModel;
  LoginController({
    required this.loginBloc,
    required this.loginModel,
  });

  Future<User?> login({
    required GlobalKey<FormState> loginKey,
  }) async {
    User? user;

    if (loginKey.currentState!.validate()) {
      loginKey.currentState!.save();
      
      loginBloc?.login(loginModel: loginModel);
    }
    return user;
  }
}
