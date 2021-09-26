import 'dart:convert';

import 'package:commerce/models/Category.dart';
import 'package:commerce/models/Product.dart';
import 'package:commerce/models/User.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:http/http.dart' as http;

class Api {
  static Future<bool> register({name, email, phone, password}) async {
    Uri uri = Uri.parse("${Constants.BASE_URL}/api/register");
    var json = jsonEncode(
        {"name": name, "email": email, "phone": phone, "password": password});
    var response = await http.post(uri, body: json, headers: Constants.headers);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      return true;
    }
    return false;
  }

  static Future<bool> login({phone, password}) async {
    Uri uri = Uri.parse("${Constants.BASE_URL}/api/login");
    var json = jsonEncode({"phone": phone, "password": password});
    var response = await http.post(uri, body: json, headers: Constants.headers);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      Constants.user = User.fromJson(responseData["result"]);
      return true;
    }
    return false;
  }

  static Future<bool> getCategories() async {
    Uri uri = Uri.parse("${Constants.API_URL}/cats");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      List lisy = responseData["result"] as List;
      Constants.categories = lisy.map((e) => Category.fromJson(e)).toList();
      return true;
    }
    return false;
  }

  static Future<List<Product>> paginateProduct({page}) async {
    List<Product> productList = [];
    Uri uri = Uri.parse("${Constants.API_URL}/products/$page");
    var response = await http.get(uri);
    var responseData = jsonDecode(response.body);
    if (responseData["con"]) {
      List lisy = responseData["result"] as List;
      productList = lisy.map((e) => Product.fromJson(e)).toList();
    }
    return productList;
  }
}
