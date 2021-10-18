import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel productModel;

  const ProductItem(this.productModel, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Row(
        children: [
          Image.network(productModel.image, scale: 0.25),
          Text(productModel.name),
          Text('\$ ${productModel.price}')
        ],
      ),
    );
  }
}
