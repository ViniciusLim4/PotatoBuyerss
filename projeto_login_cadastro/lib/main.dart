import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:projeto_login_cadastro/core/modular.dart';
import 'package:projeto_login_cadastro/main_app.dart';

void main() {
  runApp(ModularApp(module: AppModule(), child: const MainApp()));
}
