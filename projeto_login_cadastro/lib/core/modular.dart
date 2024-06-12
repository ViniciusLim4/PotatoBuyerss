import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/login/login_module.dart';

class MainModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ModuleRoute(
          '/',
          module: LoginModule(),
        ),
      ];
}

class AppModule extends MainModule {}