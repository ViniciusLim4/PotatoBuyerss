import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/data/datasources/login_datasource.dart';
import 'package:projeto_login_cadastro/data/models/login_model.dart';
import 'package:projeto_login_cadastro/data/repositories/login_repository_impl.dart';
import 'package:projeto_login_cadastro/domain/usecase/login/login_use_case.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_module.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/login_page.dart';
import 'package:projeto_login_cadastro/shared/app_routes/app_routes.dart';

class LoginModule extends Module {
  @override
  List<Bind> get binds => [
        Bind((_) => Dio()),
        Bind((_) => Connectivity()),
        Bind((i) => LoginDataSourceImpl(i<Dio>())),
        Bind((i) =>
            LoginRepositoryImpl(i<LoginDataSourceImpl>(), i<Connectivity>())),
        Bind((i) => LoginUseCase(i<LoginRepositoryImpl>())),
        Bind((i) => LoginModel(email: '', password: '')),
        Bind(
          (i) => LoginBloc(
            loginUseCase: i<LoginUseCase>(),
            loginModel: i<LoginModel>(),
          ),
        ),
        Bind(
          (i) => LoginController(
            loginBloc: i<LoginBloc>(),
            loginModel: i<LoginModel>(),
          ),
        ),
      ];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => LoginPage(
            controller: Modular.get<LoginController>(),
          ),
        ),
        ModuleRoute(
          AppRoutes.cadastro,
          module: CadastroModule(),
          transition: TransitionType.fadeIn,
        )
      ];
}
