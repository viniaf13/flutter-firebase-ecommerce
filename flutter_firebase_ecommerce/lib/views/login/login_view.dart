import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/app_routes.dart';
import 'package:get/route_manager.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: TextButton(
          child: const Text('GO TO HOME'),
          onPressed: () => Get.toNamed(AppRoutes.homeRoute),
        ),
      ),
    );
  }
}
