// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  final String labelText;
  final bool isObscured;
  final TextEditingController textController;
  final Function(String) onChanged;

  const LoginTextForm(
      {required this.labelText,
      required this.textController,
      required this.onChanged,
      this.isObscured = false});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textController,
      onChanged: onChanged,
      obscureText: isObscured,
      decoration: InputDecoration(
        label: Text(labelText),
        labelStyle: const TextStyle(fontSize: 14, color: Colors.blueAccent),
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.blueAccent,
          ),
        ),
      ),
    );
  }
}
