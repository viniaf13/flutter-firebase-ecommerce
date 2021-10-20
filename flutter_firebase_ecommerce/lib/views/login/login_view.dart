import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/views/home/home_view.dart';
import 'package:flutter_firebase_ecommerce/views/shared/login_text_form.dart';
import 'package:flutter_firebase_ecommerce/views/shared/loading_widget.dart';
import 'package:flutter_firebase_ecommerce/views/signup/signup_view.dart';
import 'package:get/get.dart';

class LoginView extends StatelessWidget {
  LoginView({Key? key}) : super(key: key);

  final AuthenticationController _authController = Get.find();
  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Image.asset(
                'assets/images/logo.png',
                height: screenWidth * 0.486,
              ),
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
                padding: EdgeInsets.only(top: screenWidth * 0.1),
                child: Obx(
                  () => OutlinedButton(
                    child: const Text('Entrar'),
                    onPressed: _authController.isEmailSenhaPreenchidos
                        ? () async {
                            LoadingWidget.show(context);
                            await _authController.signIn().then((sucess) async {
                              if (sucess) {
                                await _productsController.getAllProducts();
                                Get.off(() => HomeView());
                              }
                            });
                            LoadingWidget.suppress();
                          }
                        : null,
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: screenWidth * 0.025),
                child: OutlinedButton(
                  child: const Text('Cadastrar'),
                  onPressed: () => Get.to(() => SignupView()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
