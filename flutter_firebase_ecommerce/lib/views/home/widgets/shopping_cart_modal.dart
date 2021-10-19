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
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Obx(
              () => GestureDetector(
                onTap: null,
                child: PhysicalModel(
                  color: Colors.grey.withOpacity(.4),
                  elevation: 2,
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.blueAccent,
                    ),
                    child: Container(
                      margin: const EdgeInsets.all(14),
                      alignment: Alignment.center,
                      child: Text(
                        'Checkout (\$${_cartController.totalCartPrice.value})',
                        style:
                            const TextStyle(color: Colors.white, fontSize: 22),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
