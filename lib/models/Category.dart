class Category {
  String? id, name, image;
  List<SubCat>? subcats;

  Category({this.id, this.name, this.image, this.subcats});

  factory Category.fromJson(dynamic data) {
    List lisy = data["subcats"] as List;
    List<SubCat> sc = lisy.map((e) => SubCat.fromJson(e)).toList();
    return Category(
        id: data["_id"], name: data["name"], image: data["image"], subcats: sc);
  }
}

class SubCat {
  String? id, name, image, catid;
  List<ChildCat>? childcats;

  SubCat({this.id, this.name, this.image, this.catid, this.childcats});

  factory SubCat.fromJson(dynamic data) {
    List lisy = data["childcats"] as List;
    List<ChildCat> cc = lisy.map((e) => ChildCat.fromJson(e)).toList();
    return SubCat(
        id: data["_id"],
        name: data["name"],
        image: data["image"],
        catid: data["catid"],
        childcats: cc);
  }
}

class ChildCat {
  String? id, name, image, subcatid;

  ChildCat({this.id, this.name, this.image, this.subcatid});

  factory ChildCat.fromJson(dynamic data) {
    return ChildCat(
        id: data["_id"],
        name: data["name"],
        image: data["image"],
        subcatid: data["subcatid"]);
  }
}
