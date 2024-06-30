import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/data/datasources/cadastro_datasource.dart';
import 'package:projeto_login_cadastro/data/models/cadastro_model.dart';
import 'package:projeto_login_cadastro/data/repositories/cadastro_repository_impl.dart';
import 'package:projeto_login_cadastro/domain/repositories/cadastro_repository.dart';
import 'package:projeto_login_cadastro/domain/usecase/cadastro/cadastro_usecase.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/bloc/cadastro_bloc.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_page.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/controller/cadastro_controller.dart';

class CadastroModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => Dio()),
        Bind((_) => Connectivity()),
        Bind((i) => CadastroDataSourceImpl(i<Dio>())),
        Bind((i) => CadastroRepositoryImpl(
            i<CadastroDataSourceImpl>(), i<Connectivity>())),
        Bind((i) => CadastroRepository),
        Bind((i) => CadastroUsecase(i<CadastroRepositoryImpl>())),
        Bind(
          (i) => CadastroController(
              cadastroBloc: i<CadastroBloc>(),
              registerModel: i<RegisterModel>()),
        ),
        Bind(
          (i) => RegisterModel(
              cpf: '', email: '', nome: '', senha: '', telefone: ''),
        ),
        Bind(
          (i) => CadastroBloc(
            cadastroUsecase: i<CadastroUsecase>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => CadastroPage(
            controller: Modular.get<CadastroController>(),
          ),
        ),
      ];
}
