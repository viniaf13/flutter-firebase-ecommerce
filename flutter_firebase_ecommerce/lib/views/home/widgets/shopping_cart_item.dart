import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_firebase_ecommerce/models/cart_item_model.dart';
import 'package:get/get.dart';

class ShoppingCartItem extends StatelessWidget {
  final CartItemModel cartItem;

  ShoppingCartItem({Key? key, required this.cartItem}) : super(key: key);

  final CartController _cartController = Get.find();

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
                    onPressed: () =>
                        _cartController.decreaseItemQuantity(cartItem)),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    cartItem.quantity.toString(),
                  ),
                ),
                IconButton(
                    icon: const Icon(Icons.chevron_right),
                    onPressed: () =>
                        _cartController.increaseItemQuantity(cartItem)),
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
