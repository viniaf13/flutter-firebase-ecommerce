// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/views/login/widgets/login_text_form.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final AuthenticationController _authenticationController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FractionallySizedBox(
                widthFactor: 0.75,
                child: Column(
                  children: [
                    LoginTextForm(
                        'Email', _authenticationController.email.value),
                    LoginTextForm('Senha',
                        _authenticationController.password.value, true),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: Get.width * 0.1),
                child: TextButton(
                  child: const Text('Login'),
                  onPressed: () => _authenticationController.signIn(
                      _authenticationController.email.value.text,
                      _authenticationController.password.value.text),
                ),
                // _authenticationController.isEmailSenhaPreenchidos.value
                //     ? () => _authenticationController.signIn(
                //         _authenticationController.email.value.text,
                //         _authenticationController.password.value.text)
                //     : null),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
