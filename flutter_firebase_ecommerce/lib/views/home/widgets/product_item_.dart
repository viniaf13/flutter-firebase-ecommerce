import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:get/get_navigation/src/extension_navigation.dart';
import 'package:get/instance_manager.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  ProductItem(this.product, {Key? key}) : super(key: key);

  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      elevation: 5,
      shadowColor: Colors.grey.withOpacity(.5),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: ClipRRect(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              child: Image.network(
                product.image,
                scale: Get.size.aspectRatio * 0.8,
                filterQuality: FilterQuality.none,
              ),
            ),
          ),
          Text(product.name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              IconButton(
                  padding: EdgeInsets.all(0),
                  splashColor: Colors.blueAccent,
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () => _cartController.addItemToCart(product))
            ],
          ),
        ],
      ),
    );
  }
}
