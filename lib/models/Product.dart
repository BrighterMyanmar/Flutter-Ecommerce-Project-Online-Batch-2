import 'package:commerce/models/Delivery.dart';
import 'package:commerce/models/Warranty.dart';

class Product {
  String? id, name, brand, size, desc, detail;

  //cat, subcat, childcat, tag;
  int? price, discount;
  double? rating;
  bool? status;
  int count = 1;

  List<dynamic>? images;
  List<dynamic>? colors;
  List<dynamic>? features;
  List<Delivery>? deliveries;
  List<Warranty>? warranties;

  Product(
      {this.id,
      this.name,
      this.brand,
      this.size,
      this.desc,
      this.detail,
      // this.cat,
      // this.subcat,
      // this.childcat,
      // this.tag,
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
    List deliList = data["delivery"] as List;
    List<Delivery> dlis = deliList.map((e) => Delivery.fromJson(e)).toList();
    List warList = data["warranty"] as List;
    List<Warranty> warl = warList.map((e) => Warranty.fromJson(e)).toList();
    return Product(
        id: data["_id"],
        name: data["name"],
        brand: data["brand"],
        size: data["size"],
        desc: data["desc"],
        detail: data["detail"],
        // cat: data["cat"],
        // subcat: data["subcat"],
        // childcat: data["childcat"],
        // tag: data["tag"],
        price: data["price"],
        discount: data["discount"],
        rating: data["rating"],
        images: imgs,
        colors: cls,
        status: data["status"],
        features: fts,
        deliveries: dlis,
        warranties: warl);
  }
}

/*
  {
            "cat": {
                "subcats": [
                    "615899a1f6ee5664c697fb0d",
                    "615899a1f6ee5664c697fb0e",
                    "615899a1f6ee5664c697fb0f"
                ],
                "_id": "615899a1f6ee5664c697faa8",
                "name": "Clothing",
                "image": "https://picsum.photos/300/250",
                "created": "2021-10-02T17:40:49.609Z",
                "__v": 0
            },
            "subcat": {
                "childcats": [
                    "615899a1f6ee5664c697fb3b",
                    "615899a1f6ee5664c697fb3c",
                    "615899a1f6ee5664c697fb3d"
                ],
                "_id": "615899a1f6ee5664c697fb0d",
                "name": "Man Ware",
                "image": "/https://picsum.photos/300/250",
                "catid": "615899a1f6ee5664c697faa8",
                "created": "2021-10-02T17:40:49.700Z",
                "__v": 0
            },
            "childcat": {
                "_id": "615899a1f6ee5664c697fb3c",
                "name": "Shirt",
                "image": "/https://picsum.photos/300/250",
                "subcatid": "615899a1f6ee5664c697fb0d",
                "created": "2021-10-02T17:40:49.761Z",
                "__v": 0
            },
            "tag": {
                "_id": "615899a1f6ee5664c697faaf",
                "name": "Latest",
                "image": "https://picsum.photos/300/250",
                "created": "2021-10-02T17:40:49.614Z",
                "__v": 0
            },
            "created": "2021-10-02T17:42:29.571Z",
            "__v": 0
        },
 */
