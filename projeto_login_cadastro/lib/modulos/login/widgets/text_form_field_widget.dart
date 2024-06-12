// ignore_for_file: public_member_api_docs, sort_constructors_first
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
      child: TextFormField(
        controller: controller,
        style: const TextStyle(color: Colors.white),
        decoration: InputDecoration(
          labelText: labelText,
          labelStyle: const TextStyle(color: Colors.white),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.blueAccent),
          ),
          border: InputBorder.none,
        ),
        onSaved: (newValue) => onSave,
      ),
    );
  }
}
