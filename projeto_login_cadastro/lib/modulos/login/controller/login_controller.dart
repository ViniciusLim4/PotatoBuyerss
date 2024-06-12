import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/domain/entities/user.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';

class LoginController {
  final LoginBloc? loginBloc;
  final LoginModel? loginModel;
  LoginController({
    this.loginBloc,
    this.loginModel,
  });

  Future<User?> login({
    required GlobalKey<FormState> formKey,
  }) async {
    User? user;

    if (formKey.currentState!.validate()) {
      formKey.currentState!.save();
      
      loginBloc?.logIn(loginModel!);
    }
    return user;
  }
}
