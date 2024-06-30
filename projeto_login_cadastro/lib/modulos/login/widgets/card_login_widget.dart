import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/login_state.dart/login_state.dart';
import 'package:projeto_login_cadastro/modulos/login/widgets/login_redes_sociais_widget.dart';
import 'package:projeto_login_cadastro/shared/app_colors/app_colors.dart';
import 'package:projeto_login_cadastro/shared/components/button_widget.dart';

class CardLoginWidget extends StatefulWidget {
  final LoginController controller;

  const CardLoginWidget({super.key, required this.controller});

  @override
  State<CardLoginWidget> createState() => _CardLoginWidgetState();
}

class _CardLoginWidgetState extends State<CardLoginWidget> {
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  final FocusNode _focus = FocusNode();
  LoginController get controller => widget.controller;


  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Builder(
          builder: (context) {
            return Card(
              margin: EdgeInsets.zero,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              elevation: 10,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: BlocBuilder<LoginBloc, LoginState>(
                  bloc: controller.loginBloc,
                  builder: (context, state) {
                    return Form(
                      key: loginKey,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Text(
                            'LOGIN',
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20,
                            ),
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            controller: email,
                            style: const TextStyle(color: Colors.black),
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Email',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,),
                              ),
                            ),
                            onSaved: (value) {
                              controller.loginBloc?.loginModel.email = value;
                            },
                          ),
                          const SizedBox(height: 20),
                          TextFormField(
                            keyboardType: TextInputType.streetAddress,
                            style: const TextStyle(color: Colors.black),
                            obscureText: true,
                            decoration: const InputDecoration(
                              isDense: true,
                              labelText: 'Senha',
                              labelStyle: TextStyle(color: Colors.black),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(color: Colors.grey,),
                              ),
                            ),
                            onSaved: (value) {
                              controller.loginBloc?.loginModel.password = value;
                            },
                          ),
                          const SizedBox(height: 40),
                          ButtonWidget(
                            textButton: 'Entrar',
                            onTap: () {
                              _doLoginHandler();
                              FocusScope.of(context).unfocus();
                            },
                            isLoading: state is LoginLoadingState,
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Expanded(
                                child: Divider(),
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 8.0),
                                child: Text('Ou'),
                              ),
                              Expanded(
                                child: Divider(),
                              ),
                            ],
                          ),
                          const SizedBox(height: 20),
                          const DigitalMediaLogin(),
                          const SizedBox(height: 20),
                          TextButton(
                            onPressed: () {
                              Modular.to.pushNamed('/cadastro');
                            },
                            child: const Text(
                              'Cadastrar',
                              style: TextStyle(color: Colors.black),
                            ),
                          )
                        ],
                      ),
                    );
                  },
                ),
              ),
            );
          },
        ),
      ),
    );
  }

  Future<void> _doLoginHandler() async {
    var user = await controller.login(loginKey: loginKey);
    if (user != null) {
      TextInput.finishAutofillContext();
      //COLOCAR ROTA PARA HOME
      //Modular.to.navigate(RoutesCombined.home);
    }
  }
}
