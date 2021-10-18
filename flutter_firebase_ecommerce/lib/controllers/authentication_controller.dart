import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/repositories/user_repository.dart';
import 'package:flutter_firebase_ecommerce/views/home/home_view.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  Rx<String> email = ''.obs;
  Rx<String> password = ''.obs;

  // ignore: unused_field
  final UserRepository _userRepository;

  bool get isEmailSenhaPreenchidos =>
      email.value.isNotEmpty && password.value.isNotEmpty;

  AuthenticationController(this._userRepository);

  void signIn(String email, String password) async {
    await _userRepository
        .authenticateUser(email, password)
        .then((isUsuarioAutenticado) {
      if (isUsuarioAutenticado) {
        clearController();
        Get.off(() => const HomeView());
      }
    });
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    email.value = '';
    password.value = '';
  }
}
