import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/bloc/cadastro_bloc.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_page.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/controller/cadastro_controller.dart';

class CadastroModule extends Module {
  @override
  List<Bind> get binds => [
        Bind(
          (i) => CadastroController(
            cadastroBloc: i<CadastroBloc>(),
          ),
        ),
        Bind(
          (i) => CadastroBloc(),
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
