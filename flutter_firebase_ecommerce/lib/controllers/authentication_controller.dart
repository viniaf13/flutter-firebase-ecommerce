import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/repositories/user_repository.dart';
import 'package:flutter_firebase_ecommerce/views/home/home_view.dart';
import 'package:get/get.dart';

class AuthenticationController extends GetxController {
  Rx<TextEditingController> email = TextEditingController().obs;
  Rx<TextEditingController> password = TextEditingController().obs;

  // ignore: unused_field
  final UserRepository _userRepository;

  Rx<bool> get isEmailSenhaPreenchidos =>
      (email.value.text.isNotEmpty && password.value.text.isNotEmpty).obs;

  AuthenticationController(this._userRepository);

  void signIn(String email, String password) async {
    await _userRepository
        .authenticateUser(email, password)
        .then((isUsuarioAutenticado) {
      if (isUsuarioAutenticado) Get.off(const HomeView());
    });
  }
}
