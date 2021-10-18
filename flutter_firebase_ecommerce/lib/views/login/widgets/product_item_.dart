import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:flutter_firebase_ecommerce/utils/snackbar_utils.dart';
import 'package:get/instance_manager.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  ProductItem(this.product, {Key? key}) : super(key: key);

  final ProductsController _productsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Card(
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
                scale: 0.25,
              ),
            ),
          ),
          Text(product.name,
              style:
                  const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Text('\$ ${product.price}',
                      style: const TextStyle(
                          fontSize: 22, fontWeight: FontWeight.bold))),
              IconButton(
                  splashColor: Colors.blueAccent,
                  //splashRadius: 20,
                  icon: const Icon(Icons.add_shopping_cart),
                  onPressed: () {
                    _productsController.addProductToCart(product);
                    SnackbarUtils.showSucessSnackbar(
                        title: 'Produto adicionado com sucesso',
                        message:
                            '${product.name} foi adicionado ao carrinho de compras.');
                  })
            ],
          ),
        ],
      ),
    );
  }
}
