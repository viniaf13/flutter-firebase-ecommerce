import 'package:flutter_firebase_ecommerce/models/cart_item_model.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:flutter_firebase_ecommerce/utils/snackbar_utils.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartItens = <CartItemModel>[].obs;
  Rx<int> totalCartPrice = 0.obs;

  void addItemToCart(ProductModel product) {
    if (cartItens.any((item) => product.id == item.id)) {
      SnackbarUtils.showErrorSnackbar(
          title: 'Produto já adicionado',
          message: 'Este produto já foi adicionado ao carrinho de compras.');
    } else {
      cartItens.add(CartItemModel(
          product: product,
          quantity: 1,
          totalItemPrice: product.price,
          id: product.id));
      totalCartPrice.value += product.price;
      SnackbarUtils.showSucessSnackbar(
          title: 'Produto adicionado com sucesso',
          message: '${product.name} foi adicionado ao carrinho de compras.');
    }
  }
}
