import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';

class SearchTextFormField extends StatelessWidget {
  const SearchTextFormField({
    Key? key,
    required ProductsController productsController,
  })  : _productsController = productsController,
        super(key: key);

  final ProductsController _productsController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
          labelText: 'Pesquise por produtos',
          suffixIcon: Icon(
            Icons.search,
            color: Colors.blueAccent,
          ),
          labelStyle: TextStyle(fontSize: 14, color: Colors.blueAccent),
          enabledBorder: UnderlineInputBorder(
              borderSide: BorderSide(color: Colors.blueAccent))),
      textInputAction: TextInputAction.search,
      controller: _productsController.searchProductController.value,
      onChanged: (String text) =>
          _productsController.searchProductTerm.value = text,
    );
  }
}
