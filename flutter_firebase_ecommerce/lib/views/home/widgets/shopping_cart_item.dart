import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/cart_item_model.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartItemModel cartItem;

  ShoppingCartItem({required this.cartItem});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.network(
            cartItem.product.image,
            scale: 0.75,
            width: 70,
          ),
        ),
        Expanded(
            child: Wrap(
          direction: Axis.vertical,
          children: [
            Container(
                padding: const EdgeInsets.only(left: 20),
                child: Text(
                  cartItem.product.name,
                  style: const TextStyle(fontSize: 18),
                )),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                    icon: const Icon(Icons.chevron_left),
                    onPressed: () {
                      //cartController.decreaseQuantity(cartItem);
                    }),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartItem.quantity.toString(),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () {
                      //cartController.increaseQuantity(cartItem);
                    }),
              ],
            )
          ],
        )),
        Padding(
          padding: const EdgeInsets.all(14),
          child: Text(
            '\$${cartItem.totalItemPrice}',
            style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    );
  }
}
