import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'shared/app_colors/app_colors.dart';

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: AppColors.primaryYellow,
      ),
      title: 'MyApp',
      initialRoute: Modular.initialRoute,
    ).modular();
  }
}
