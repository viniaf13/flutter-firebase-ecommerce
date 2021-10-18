import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:flutter_firebase_ecommerce/repositories/products_repository.dart';
import 'package:get/get.dart';

class ProductsController extends GetxController {
  // ignore: unused_field
  final ProductsRepository _productsRepository;
  ProductsController(this._productsRepository);

  RxList<ProductModel> allProducts = <ProductModel>[].obs;

  void getAllProducts() async {
    allProducts.assignAll(await _productsRepository.getAllProducts());
  }
}
