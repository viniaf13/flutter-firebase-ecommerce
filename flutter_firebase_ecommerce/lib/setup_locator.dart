import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/repositories/user_repository.dart';
import 'package:get/instance_manager.dart';

void setupLocator() {
  // Repositories
  Get.put(UserRepository());

  //Stores
  Get.put(AuthenticationController(Get.find<UserRepository>()));
}
