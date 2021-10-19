import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/repositories/user_repository.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  Rx<String> email = ''.obs;
  Rx<String> password = ''.obs;

  bool _isLoggedIn = false;

  final UserRepository _userRepository;

  bool get isEmailSenhaPreenchidos =>
      email.value.isNotEmpty && password.value.isNotEmpty;

  AuthenticationController(this._userRepository);

  Future<bool> signIn(String email, String password) async {
    await _userRepository
        .authenticateUser(email, password)
        .then((isUsuarioAutenticado) {
      if (isUsuarioAutenticado) {
        clearController();
        _isLoggedIn = true;
      }
    });
    return _isLoggedIn;
  }

  void clearController() {
    emailController.clear();
    passwordController.clear();
    email.value = '';
    password.value = '';
  }
}
