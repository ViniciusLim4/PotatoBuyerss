import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/login_state.dart/login_state.dart';
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
  LoginController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Builder(
        builder: (context) {
          return Card(
            margin: EdgeInsets.zero,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            ),
            elevation: 10,
            child: Container(
              decoration: const BoxDecoration(
                color: Colors.white38,
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: BlocBuilder<LoginBloc, LoginState>(
                    bloc: controller.loginBloc,
                    builder: (context, state) {
                      return Form(
                        key: loginKey,
                        child: Stack(
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Text(
                                  'LOGIN',
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 20,
                                  ),
                                ),
                                const SizedBox(
                                  height: 14,
                                ),
                                TextFormField(
                                  controller: email,
                                  style: const TextStyle(color: Colors.black),
                                  decoration: const InputDecoration(
                                    labelText: 'Email',
                                    labelStyle: TextStyle(color: Colors.black),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    border: InputBorder.none,
                                  ),
                                  onSaved: (value) {
                                    controller.loginBloc?.loginModel.email =
                                        value;
                                  },
                                ),
                                const SizedBox(height: 30),
                                TextFormField(
                                  style: const TextStyle(color: Colors.black),
                                  obscureText: true,
                                  decoration: const InputDecoration(
                                    labelText: 'Senha',
                                    labelStyle: TextStyle(color: Colors.black),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide:
                                          BorderSide(color: Colors.blueAccent),
                                    ),
                                    border: InputBorder.none,
                                    enabledBorder: InputBorder.none,
                                  ),
                                  onSaved: (value) {
                                    controller.loginBloc?.loginModel.password =
                                        value;
                                  },
                                ),
                                const SizedBox(height: 15),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    if (state is LoginLoadingState)
                                      const CircularProgressIndicator()
                                    else
                                      ButtonWidget(
                                        textButton: 'Entrar',
                                        onTap: () => _doLoginHandler(),
                                      ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        Modular.to.pushNamed('/cadastro');
                                      },
                                      child: const Text(
                                        'Cadastrar',
                                        style: TextStyle(color: Colors.black),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                            // Positioned(
                            //   top: 0,
                            //   left: 0,
                            //   right: 0,
                            //   child: ClipRRect(
                            //     borderRadius: BorderRadius.circular(50),
                            //     child:
                            //         Image.asset('lib/assets/logo_potato.png'),
                            //   ),
                            // ),
                          ],
                        ),
                      );
                    }),
              ),
            ),
          );
        },
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
