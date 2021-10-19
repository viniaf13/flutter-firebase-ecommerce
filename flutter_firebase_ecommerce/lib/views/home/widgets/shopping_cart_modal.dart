import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/cart_controller.dart';
import 'package:flutter_firebase_ecommerce/views/home/widgets/shopping_cart_item.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';

class ShoppingCartModal extends StatelessWidget {
  ShoppingCartModal({Key? key}) : super(key: key);

  final CartController _cartController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ListView(
          children: [
            const Center(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 25.0),
                child: Text(
                  'Carrinho de compras',
                  style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.blueAccent),
                ),
              ),
            ),
            Obx(
              () => Column(
                children: _cartController.cartItens
                    .map(
                      (cartItem) => ShoppingCartItem(
                        cartItem: cartItem,
                      ),
                    )
                    .toList(),
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 30,
          child: Container(
            width: Get.width,
            color: Colors.blueAccent,
            padding: const EdgeInsets.all(8),
            child: Obx(
              () => TextButton(
                child: Text(
                    'Checkout (\$${_cartController.totalCartPrice.value})'),
                onPressed: null,
              ),
            ),
          ),
        )
      ],
    );
  }
}
