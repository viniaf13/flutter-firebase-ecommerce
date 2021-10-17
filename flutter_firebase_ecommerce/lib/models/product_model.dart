class ProductModel {
  String? id;
  String? name;
  String? image;
  int? price;

  ProductModel(this.id, this.name, this.image, this.price);

  ProductModel.fromMap(dynamic data) {
    id = data['id'];
    image = data['image'];
    name = data['name'];
    price = int.parse(data['price']);
  }
}
