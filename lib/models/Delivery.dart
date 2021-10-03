class Delivery {
  List<dynamic>? remarks;
  String? id, name, duration, image;
  int? price;

  Delivery(
      {this.remarks,
      this.id,
      this.name,
      this.duration,
      this.image,
      this.price});

  factory Delivery.fromJson(dynamic data) {
    List<dynamic> rmks = data["remarks"] as List;
    return Delivery(
        remarks: rmks,
        id: data["_id"],
        name: data["name"],
        duration: data["duration"],
        image: data["image"],
        price: data["price"]);
  }
}
