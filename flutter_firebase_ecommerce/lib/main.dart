import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/app_routes.dart';
import 'package:flutter_firebase_ecommerce/views/login/login_view.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const LoginView(),
      getPages: AppRoutes.getPageList(),
    );
  }
}
