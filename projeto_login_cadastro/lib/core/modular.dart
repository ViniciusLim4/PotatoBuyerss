import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_module.dart';
import 'package:projeto_login_cadastro/modulos/login/login_module.dart';
import 'package:projeto_login_cadastro/shared/app_routes/app_routes.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          AppRoutes.initialRoute,
          module: LoginModule(),
        ),
        ModuleRoute(
          AppRoutes.cadastro,
          module: CadastroModule(),
        ),
      ];
}

class AppModule extends MainModule {}