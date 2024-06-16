import 'package:flutter/material.dart';

class TextFormFieldWidget extends StatelessWidget {
  final TextEditingController? controller;
  final VoidCallback? onSave;
  final String? labelText;

  const TextFormFieldWidget({
    super.key,
    this.controller,
    this.onSave,
    this.labelText,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          child: TextFormField(
            controller: controller,
            style: const TextStyle(color: Colors.black),
            decoration: InputDecoration(
              labelText: labelText,
              labelStyle: const TextStyle(color: Colors.black),
              border: InputBorder.none,
              focusedBorder: InputBorder.none,
              enabledBorder: InputBorder.none,
              errorBorder: InputBorder.none,
              disabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: Colors.white),
              ),
              fillColor: Colors.white,
            ),
            onSaved: (newValue) => onSave,
          ),
        ),
      ),
    );
  }
}
