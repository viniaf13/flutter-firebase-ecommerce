import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/repositories/products_repository.dart';
import 'package:flutter_firebase_ecommerce/repositories/user_repository.dart';
import 'package:get/instance_manager.dart';

import 'controllers/products_controller.dart';

void setupLocator() {
  // Repositories
  Get.put(UserRepository());
  Get.put(ProductsRepository());

  //Stores
  Get.put(AuthenticationController(Get.find<UserRepository>()));
  Get.put(ProductsController(Get.find<ProductsRepository>()));
}
