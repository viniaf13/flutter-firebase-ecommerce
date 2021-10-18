import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:flutter_firebase_ecommerce/repositories/products_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  final ProductsRepository _productsRepository;
  ProductsController(this._productsRepository);

  TextEditingController searchProductController = TextEditingController();
  Rx<String> searchProductTerm = ''.obs;

  RxList<ProductModel> allProducts = <ProductModel>[].obs;
  RxList<ProductModel> selectedProducts = <ProductModel>[].obs;

  Future<void> getAllProducts() async {
    allProducts.assignAll(await _productsRepository.getAllProducts());
  }

  void addProductToCart(ProductModel product) {
    selectedProducts.add(product);
  }

  List<ProductModel> get displayedProducts => searchProductTerm.value.isEmpty
      ? allProducts
      : allProducts
          .where((product) => product.name
              .toLowerCase()
              .contains(searchProductTerm.value.toLowerCase()))
          .toList();
}
