import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/views/login/login_view.dart';
import 'package:flutter_firebase_ecommerce/views/shared/loading_widget.dart';
import 'package:flutter_firebase_ecommerce/views/shared/login_text_form.dart';
import 'package:get/get.dart';

class SignupView extends StatelessWidget {
  SignupView({Key? key}) : super(key: key);

  final AuthenticationController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return WillPopScope(
      onWillPop: () async {
        _authController.clearController();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(),
        body: Center(
          child: SingleChildScrollView(
            child: FractionallySizedBox(
              widthFactor: 0.75,
              child: Column(
                children: [
                  const Text(
                    'Crie a sua conta',
                    style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 32,
                        fontWeight: FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: screenWidth * 0.1, bottom: screenWidth * 0.05),
                    child: const Text(
                      'Digite um email válido e uma senha que possua mais de 6 caracteres.',
                      style: TextStyle(
                        color: Colors.blueAccent,
                        fontSize: 14,
                      ),
                    ),
                  ),
                  LoginTextForm(
                      labelText: 'Digite o seu email',
                      textController: _authController.emailController,
                      onChanged: (String text) =>
                          _authController.email.value = text),
                  LoginTextForm(
                    labelText: 'Digite a sua senha',
                    textController: _authController.passwordController,
                    onChanged: (String text) =>
                        _authController.password.value = text,
                    isObscured: true,
                  ),
                  LoginTextForm(
                    labelText: 'Confirme a sua senha',
                    textController: _authController.confirmPasswordController,
                    onChanged: (String text) =>
                        _authController.confirmPassword.value = text,
                    isObscured: true,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: screenWidth * 0.1),
                    child: Obx(
                      () => OutlinedButton(
                        child: const Text('Criar conta'),
                        onPressed: _authController.isCadastroPreenchido
                            ? () async {
                                LoadingWidget.show(context);
                                await _authController.signUp().then((sucess) {
                                  if (sucess) Get.off(() => LoginView());
                                });
                                LoadingWidget.suppress();
                              }
                            : null,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
