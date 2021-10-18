import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';

class ProductItem extends StatelessWidget {
  final ProductModel product;

  const ProductItem(this.product, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(.5),
                offset: const Offset(3, 2),
                blurRadius: 7)
          ]),
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
                  icon: const Icon(Icons.add_shopping_cart), onPressed: () {})
            ],
          ),
        ],
      ),
    );
  }
}
