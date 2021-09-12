import 'dart:convert';

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
}
