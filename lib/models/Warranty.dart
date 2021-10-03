class Warranty {
  // List<dynamic>? remark;
  String? id, name, image;

  Warranty({this.id, this.name, this.image});

  factory Warranty.fromJson(dynamic data) {
    // List<dynamic> rmks = data["remarks"];
    return Warranty(
      // remark: rmks,
      id: data["_id"],
      name: data["name"],
      image: data["image"],
    );
  }
}
