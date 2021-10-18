import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_ecommerce/controllers/products_controller.dart';
import 'package:flutter_firebase_ecommerce/models/product_model.dart';
import 'package:get/get.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  final ProductsController _productsController = Get.find();

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((_) {
      _productsController.getAllProducts();
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(_productsController.allProducts);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Obx(
              () => ListView.builder(
                  shrinkWrap: true,
                  itemCount: _productsController.allProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return Container(
                      height: 50,
                      color: Colors.blueAccent,
                      child: Center(
                          child: Text(
                              'Entry ${_productsController.allProducts[index].name}')),
                    );
                  }),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          CollectionReference collectionRef =
              FirebaseFirestore.instance.collection('products');
          QuerySnapshot querySnapshot = await collectionRef.get();
          final allData = querySnapshot.docs
              .map((doc) => ProductModel.fromMap(doc.data()))
              .toList();
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
