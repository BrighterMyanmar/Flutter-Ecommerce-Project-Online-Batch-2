class Product {
  String? id, name, image;
  int? price;
  int count = 1;

  Product({this.id, this.name, this.image, this.price});

  factory Product.fromJson(dynamic data) {
    return Product(
        id: data["_id"],
        name: data["name"],
        image: data["image"],
        price: data["price"]);
  }
}
