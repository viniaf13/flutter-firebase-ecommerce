import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/views/home/widgets/custom_fab.dart';
import 'package:flutter_firebase_ecommerce/views/login/widgets/product_item_.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Pokemart'),
      ),
      body: Center(
        child: Obx(
          () => GridView.count(
            crossAxisCount: 2,
            childAspectRatio: 1,
            padding: const EdgeInsets.all(10),
            mainAxisSpacing: 4.0,
            crossAxisSpacing: 10.0,
            children: _productsController.allProducts.map((product) {
              return ProductItem(product);
            }).toList(),
          ),
        ),
      ),
      floatingActionButton: Obx(
        () => CustomFAB(
            cartProductsLength: _productsController.selectedProducts.length),
      ),
    );
  }
}
