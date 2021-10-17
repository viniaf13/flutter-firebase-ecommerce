// ignore_for_file: use_key_in_widget_constructors

import 'package:flutter/material.dart';

class LoginTextForm extends StatelessWidget {
  final String labelText;
  final bool isObscured;

  const LoginTextForm(this.labelText, [this.isObscured = true]);

  @override
  Widget build(BuildContext context) {
    return TextFormField(
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
