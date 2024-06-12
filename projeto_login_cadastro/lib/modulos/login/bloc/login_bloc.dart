// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/domain/usecase/login/login_use_case.dart';
import 'package:projeto_login_cadastro/modulos/login/login_state.dart/login_state.dart';

class LoginBloc extends Cubit<LoginState> {
  final LoginUseCase loginUseCase;
  final LoginModel loginModel;

  LoginBloc({
    required this.loginUseCase,
    required this.loginModel,
  }) : super(LoginInicialState());

  Future<void> logIn(LoginModel loginModel) async {
    return await _onlogIn(loginModel: loginModel);
  }

  Future<void> _onlogIn({required LoginModel loginModel}) async {
    emit(LoginLoadingState());
    var result = await loginUseCase(params: loginModel);
    result.fold((error) {
      emit(LoginErrorState());
    }, (success) {
      emit(LoginSuccessState(isLoading: false));
    });
  }
}
