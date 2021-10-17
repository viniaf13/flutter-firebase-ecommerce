// ignore_for_file: prefer_const_literals_to_create_immutables

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/app_routes.dart';
import 'package:flutter_firebase_ecommerce/views/login/widgets/login_text_form.dart';
import 'package:get/route_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);
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
                  const LoginTextForm('Email'),
                  const LoginTextForm('Senha', true),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: Get.width * 0.1),
              child: TextButton(
                child: const Text('Login'),
                onPressed: () => Get.toNamed(AppRoutes.homeRoute),
                // onPressed: () async {
                //   try {
                //     UserCredential userCredential = await FirebaseAuth
                //         .instance
                //         .createUserWithEmailAndPassword(
                //             email: "barry.allen@example.com",
                //             password: "SuperSecretPassword!");
                //   } on FirebaseAuthException catch (e) {
                //     if (e.code == 'weak-password') {
                //       print('The password provided is too weak.');
                //     } else if (e.code == 'email-already-in-use') {
                //       print('The account already exists for that email.');
                //     }
                //   } catch (e) {
                //     print(e);
                //   }}
              ),
            ),
          ],
        ),
      ),
    );
  }
}
