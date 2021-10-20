import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/authentication_controller.dart';
import 'package:flutter_firebase_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/views/home/widgets/custom_fab.dart';
import 'package:flutter_firebase_ecommerce/views/home/widgets/search_text_form_field.dart';
import 'package:flutter_firebase_ecommerce/views/home/widgets/product_item_.dart';
import 'package:flutter_firebase_ecommerce/views/login/login_view.dart';
import 'package:get/get.dart';

import 'widgets/shopping_cart_modal.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ProductsController _productsController = Get.find();
  final CartController _cartController = Get.find();
  final AuthenticationController _authController = Get.find();

  @override
  Widget build(BuildContext context) {
    final screenWidth = Get.width;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white10,
        centerTitle: true,
        title: Image.asset(
          'assets/images/logo.png',
          height: screenWidth * 0.365,
        ),
        leading: IconButton(
          padding: EdgeInsets.only(left: screenWidth * 0.025),
          icon: const Icon(
            Icons.logout,
            color: Colors.blueAccent,
          ),
          onPressed: () {
            _productsController.clearController();
            _cartController.clearController();
            _authController.signOut();
            Get.off(() => LoginView());
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Obx(
          () => Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    left: screenWidth * 0.06,
                    right: screenWidth * 0.06,
                    top: screenWidth * 0.02,
                    bottom: screenWidth * 0.04),
                child: SearchTextFormField(
                    productsController: _productsController),
              ),
              GridView.count(
                physics: const BouncingScrollPhysics(),
                shrinkWrap: true,
                crossAxisCount: 2,
                childAspectRatio: 1,
                padding: EdgeInsets.all(screenWidth * 0.025),
                mainAxisSpacing: 4.0,
                crossAxisSpacing: screenWidth * 0.025,
                children: _productsController.displayedProducts.map((product) {
                  return ProductItem(product);
                }).toList(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => CustomFAB(
            onPressed: () => showModalBottomSheet(
                  isScrollControlled: true,
                  context: context,
                  builder: (context) => FractionallySizedBox(
                    heightFactor: 0.9,
                    child: Container(
                      color: Colors.white,
                      child: ShoppingCartModal(),
                    ),
                  ),
                ),
            counterIndicator: _cartController.cartItens.length),
      ),
    );
  }
}
