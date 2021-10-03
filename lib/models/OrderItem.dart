class OrderItem {
  List<dynamic>? images;
  int? discount, count, price;
  String? name;

  OrderItem({this.images, this.discount, this.count, this.price, this.name});

  factory OrderItem.fromJson(dynamic data) {
    List<dynamic> imgs = data["images"] as List;
    return OrderItem(
        images: imgs,
        discount: data["discount"],
        count: data["count"],
        price: data["price"],
        name: data["name"]);
  }
}
