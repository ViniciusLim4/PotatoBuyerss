import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:projeto_login_cadastro/modulos/login/login_state.dart/login_state.dart';

class ButtonWidget extends StatelessWidget {
  final String textButton;
  final VoidCallback onTap;
  final LoginLoadingState? state;
  final bool? isLoading;

  const ButtonWidget(
      {super.key,
      required this.textButton,
      required this.onTap,
      this.state,
      this.isLoading});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:isLoading ?? false ? null : onTap,
      child: Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            color: Colors.blue.shade900),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: isLoading ?? false
                ? const CupertinoActivityIndicator(
                    radius: 14.5,
                    color: Colors.white,
                  )
                : Text(
                    textButton,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
          ),
        ),
      ),
    );
  }
}
