import 'package:commerce/models/OrderItem.dart';

class History {
  List<OrderItem>? items;
  int? count, total;
  String? created;

  History({this.items, this.count, this.created, this.total});

  factory History.fromJson(dynamic data) {
    List itemList = data["items"] as List;
    List<OrderItem> its = itemList.map((e) => OrderItem.fromJson(e)).toList();
    return History(
        items: its,
        count: data["count"],
        created: data["created"],
        total: data["total"]);
  }
}

