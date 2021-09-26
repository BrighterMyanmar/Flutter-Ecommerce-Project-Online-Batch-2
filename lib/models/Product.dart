class Product {
  String? id, name, brand, size, desc, detail, cat, subcat, childcat, tag;
  int? price, discount;
  double? rating;
  bool? status;
  int count = 1;

  List<dynamic>? images;
  List<dynamic>? colors;
  List<dynamic>? features;
  List<dynamic>? deliveries;
  List<dynamic>? warranties;

  Product(
      {this.id,
      this.name,
      this.brand,
      this.size,
      this.desc,
      this.detail,
      this.cat,
      this.subcat,
      this.childcat,
      this.tag,
      this.price,
      this.discount,
      this.rating,
      this.images,
      this.colors,
      this.status,
      this.features,
      this.deliveries,
      this.warranties});

  factory Product.fromJson(dynamic data) {
    List<dynamic> imgs = data["images"] as List;
    List<dynamic> cls = data["colors"] as List;
    List<dynamic> fts = data["features"] as List;
    List<dynamic> delivery = data["delivery"] as List;
    List<dynamic> warranty = data["warranty"] as List;
    return Product(
        id: data["_id"],
        name: data["name"],
        brand: data["brand"],
        size: data["size"],
        desc: data["desc"],
        detail: data["detail"],
        cat: data["cat"],
        subcat: data["subcat"],
        childcat: data["childcat"],
        tag: data["tag"],
        price: data["price"],
        discount: data["discount"],
        rating: data["rating"],
        images: imgs,
        colors: cls,
        status: data["status"],
        features: fts,
        deliveries: delivery,
        warranties: warranty);
  }
}
