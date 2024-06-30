import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/cadastro/controller/cadastro_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/widgets/text_form_field_widget.dart';
import 'package:projeto_login_cadastro/shared/app_colors/app_colors.dart';
import 'package:projeto_login_cadastro/shared/components/button_widget.dart';

class CardCadastroPage extends StatelessWidget {
  final CadastroController controller;
  CardCadastroPage({super.key, required this.controller});

  final GlobalKey<FormState> cadastroKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Builder(builder: (context) {
        return Card(
          color: AppColors.backgroundWhite,
          margin: EdgeInsets.zero,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(30))
          ),
          elevation: 10,
          child: SingleChildScrollView(
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Form(
                key: cadastroKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      'CADASTRO',
                      style: TextStyle(
                        color: AppColors.primaryText,
                        fontSize: 18,
                      ),
                    ),
                    TextFormFieldWidget(
                      onSave: () => {},
                      labelText: 'Nome',
                    ),
                    TextFormFieldWidget(
                      onSave: () => {},
                      labelText: 'Senha',
                    ),
                    TextFormFieldWidget(
                      onSave: () => {},
                      labelText: 'Email',
                    ),
                    TextFormFieldWidget(
                      onSave: () => {},
                      labelText: 'Cpf',
                    ),
                    TextFormFieldWidget(
                      onSave: () => {},
                      labelText: 'Telefone',
                    ),
                    const SizedBox(height: 15),
                    ButtonWidget(
                      textButton: 'Cadastrar',
                      onTap: () => _cadastrarHandler(),
                    ),
                    const SizedBox(height: 15),
                    TextButton(
                      onPressed: () {
                        Modular.to.pop();
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(color: Colors.black),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }

  Future<void> _cadastrarHandler() async {
    var user = await controller.register(cadastroKey: cadastroKey);
    if (user != null) {
      TextInput.finishAutofillContext();
      //COLOCAR ROTA PARA LOGIN
      //Modular.to.navigate(RoutesCombined.login);
    }
  }
}
