import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/views/login/widgets/product_item_.dart';
import 'package:get/get.dart';

class HomeView extends StatelessWidget {
  HomeView({Key? key}) : super(key: key);

  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: _productsController.allProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return ProductItem(_productsController.allProducts[index]);
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => 1 + 1,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
