import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/cadastro_page.dart';

class CadastroModule extends Module {
  @override
  List<Bind> get binds => [];

  @override
  List<ModularRoute> get routes => [
        ChildRoute(
          Modular.initialRoute,
          child: (_, __) => const CadastroPage(),
        ),
      ];
}
