class Order {
  String? id;
  bool? status;
  int? count, total;

  Order({this.status, this.id, this.count, this.total});

  factory Order.fromJson(dynamic data) {
    return Order(
        id: data["id"],
        count: data["count"],
        total: data["total"],
        status: data["status"]);
  }
}

class Item {
  String? name;
  List<String>? images;
  int? discount, count, price;

  Item({this.name, this.images, this.discount, this.count, this.price});

  factory Item.fromJson(dynamic data) {
    return Item(
        name: data["name"],
        images: data["images"],
        discount: data["discount"],
        count: data["count"],
        price: data["price"]);
  }
}
