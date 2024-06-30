import 'dart:ui';

import 'package:flutter/material.dart';

class AppColors {
  static const Color primaryYellow = Color(0xFFFECF52); // Amarelo Vibrante
  static const Color secondaryGreen = Color(0xFFA4D4AE); // Verde Menta
  static const Color backgroundWhite = Color(0xFFFFFFFF); // Branco Neve
  static const Color primaryText = Color(0xFF333333); // Cinza Escuro
  static const Color secondaryText = Color(0xFF777777); // Cinza Médio
  static const Color highlightOrange = Color(0xFFFF6F61); // Laranja Coral
  static const Color supportBlue = Color(0xFF87CEEB); 
  static Color prymaryBlue = Colors.blue.shade900;
}


class AppGradients {
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [
      AppColors.primaryYellow,
      AppColors.highlightOrange,
    ],
    stops: [0, 1],
    begin: Alignment(1.0, 0.1),
    end: Alignment.bottomRight,
  );
}