import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/bloc/login_bloc.dart';
import 'package:projeto_login_cadastro/modulos/login/controller/login_controller.dart';
import 'package:projeto_login_cadastro/modulos/login/login_state.dart/login_state.dart';

class CardLoginWidget extends StatefulWidget {
  final LoginController controller;

  const CardLoginWidget({super.key, required this.controller});

  @override
  State<CardLoginWidget> createState() => _CardLoginWidgetState();
}

class _CardLoginWidgetState extends State<CardLoginWidget> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController email = TextEditingController();
  final TextEditingController senha = TextEditingController();
  LoginController get controller => widget.controller;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 40, bottom: 40),
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
                gradient: LinearGradient(
                  colors: [Color(0xff283048), Color(0xff858a98)],
                  stops: [0, 1],
                  begin: Alignment(0.6, 0.0),
                  end: Alignment(0.8, -0.8),
                ),
                borderRadius: BorderRadius.all(Radius.circular(40)),
              ),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
                child: BlocBuilder<LoginBloc, LoginState>(
                    bloc: controller.loginBloc,
                    builder: (context, state) {
                      return Form(
                        key: formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'LOGIN',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                            const SizedBox(
                              height: 14,
                            ),
                            const Divider(
                              color: Colors.black,
                            ),
                            TextFormField(
                              controller: email,
                              style: const TextStyle(color: Colors.white),
                              decoration: const InputDecoration(
                                labelText: 'Email',
                                labelStyle: TextStyle(color: Colors.white),
                                focusedBorder: UnderlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.blueAccent),
                                ),
                                border: InputBorder.none,
                              ),
                              onSaved: (value) {
                                controller.loginBloc?.loginModel.email = value;
                              },
                            ),
                            const SizedBox(height: 30),
                            TextFormField(
                              style: const TextStyle(color: Colors.white),
                              obscureText: true,
                              decoration: const InputDecoration(
                                labelText: 'Senha',
                                labelStyle: TextStyle(color: Colors.white),
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
                            const Divider(
                              color: Colors.black,
                            ),
                            const SizedBox(height: 15),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Nova senha',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                ),
                                if (state is LoginLoadingState)
                                  const CircularProgressIndicator()
                                else
                                  ElevatedButton(
                                    onPressed: () {
                                      _doLoginHandler();
                                    },
                                    style: ElevatedButton.styleFrom(
                                      foregroundColor: Colors.white,
                                      backgroundColor: Colors.black,
                                    ),
                                    child: const Padding(
                                      padding: EdgeInsets.all(10),
                                      child: Text(
                                        'Entrar',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                              ],
                            )
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
    var user = await controller.login(formKey: formKey);
    if (user != null) {
      TextInput.finishAutofillContext();
      //COLOCAR ROTA PARA HOME
      //Modular.to.navigate(RoutesCombined.home);
    }
  }
}
