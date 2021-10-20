import 'package:flutter_firebase_ecommerce/models/cart_item_model.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:flutter_firebase_ecommerce/utils/snackbar_utils.dart';
import 'package:get/state_manager.dart';

class CartController extends GetxController {
  RxList<CartItemModel> cartItens = <CartItemModel>[].obs;

  void addItemToCart(ProductModel product) {
    if (cartItens.any((item) => product.id == item.id)) {
      SnackbarUtils.showErrorSnackbar(
          title: 'Produto já adicionado:',
          message: 'Este produto já foi adicionado ao carrinho de compras.');
    } else {
      cartItens.add(CartItemModel(
          product: product,
          quantity: 1,
          totalItemPrice: product.price,
          id: product.id));

      SnackbarUtils.showSucessSnackbar(
          title: 'Produto adicionado com sucesso:',
          message: '${product.name} foi adicionado ao carrinho de compras.');
    }
  }

  Rx<int> get totalCartPrice =>
      cartItens.fold<int>(0, (prev, item) => prev + item.totalItemPrice).obs;

  void increaseItemQuantity(CartItemModel cartItem) {
    int itemIndex = cartItens.indexWhere((item) => item.id == cartItem.id);
    if (itemIndex != -1) {
      cartItens[itemIndex].quantity++;
      cartItens[itemIndex].totalItemPrice += cartItem.product.price;
      cartItens.refresh();
    }
  }

  void decreaseItemQuantity(CartItemModel cartItem) {
    int itemIndex = cartItens.indexWhere((item) => item.id == cartItem.id);
    if (itemIndex != -1) {
      cartItens[itemIndex].quantity--;
      cartItens[itemIndex].totalItemPrice -= cartItem.product.price;
      cartItens.refresh();
    }
  }

  void removeItemFromCart(CartItemModel cartItem) {
    int itemIndex = cartItens.indexWhere((item) => item.id == cartItem.id);
    if (itemIndex != -1) {
      cartItens.removeAt(itemIndex);
      cartItens.refresh();
    }
  }

  void clearController() {
    cartItens = <CartItemModel>[].obs;
  }
}
