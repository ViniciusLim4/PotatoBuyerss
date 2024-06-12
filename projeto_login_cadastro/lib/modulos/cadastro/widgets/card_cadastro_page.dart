import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/modulos/login/widgets/text_form_field_widget.dart';

class CardCadastroPage extends StatelessWidget {
  CardCadastroPage({super.key});

  final GlobalKey<FormState> cadastroKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 40, bottom: 40),
      child: Builder(builder: (context) {
        return Card(
          margin: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(40),
          ),
          elevation: 10,
          child: Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color(0xff7f7fd5),
                  Color(0xff86a8e7),
                  Color(0xff91eae4)
                ],
                stops: [0, 0.5, 1],
                begin: Alignment(-1.2, 1.2),
                end: Alignment(1.1, -1.2),
              ),
              borderRadius: BorderRadius.all(Radius.circular(40)),
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 60, horizontal: 30),
              child: Form(
                key: cadastroKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'CADASTRO',
                          style: TextStyle(color: Colors.white, fontSize: 18),
                        ),
                        IconButton(
                          color: Colors.black,
                          icon: const Icon(Icons.arrow_forward_ios),
                          onPressed: () {
                            Modular.to.pop();
                          },
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 14,
                    ),
                    const Divider(
                      color: Colors.black,
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
                    const Divider(
                      color: Colors.black,
                    ),
                    const SizedBox(height: 15),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        ElevatedButton(
                          onPressed: () {},
                          style: ElevatedButton.styleFrom(
                            foregroundColor: Colors.white,
                            backgroundColor: Colors.black,
                          ),
                          child: const Padding(
                            padding: EdgeInsets.all(10),
                            child: Text(
                              'Cadastrar',
                              style: TextStyle(color: Colors.white),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ),
        );
      }),
    );
  }
}
