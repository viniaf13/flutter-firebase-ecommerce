// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/views/home/home_view.dart';
import 'package:flutter_firebase_ecommerce/views/login/widgets/login_text_form.dart';
import 'package:get/get.dart';
import 'package:get/route_manager.dart';
import 'package:get/instance_manager.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final AuthenticationController _authController = Get.find();
  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FractionallySizedBox(
              widthFactor: 0.75,
              child: Column(
                children: [
                  LoginTextForm(
                      labelText: 'Email',
                      textController: _authController.emailController,
                      onChanged: (String text) =>
                          _authController.email.value = text),
                  LoginTextForm(
                    labelText: 'Senha',
                    textController: _authController.passwordController,
                    onChanged: (String text) =>
                        _authController.password.value = text,
                    isObscured: true,
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.width * 0.1),
              child: Obx(
                () => TextButton(
                  child: const Text('Login'),
                  onPressed: _authController.isEmailSenhaPreenchidos
                      ? () async {
                          await _authController
                              .signIn(_authController.email.value,
                                  _authController.password.value)
                              .then((sucess) async {
                            if (sucess) {
                              await _productsController.getAllProducts();
                              Get.off(() => HomeView());
                            }
                          });
                        }
                      : null,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
