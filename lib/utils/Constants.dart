import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:commerce/models/User.dart';
import 'package:commerce/models/Category.dart';
import 'package:commerce/models/Product.dart';

class Constants{
  static const Color primary = Color(0xFFF6F6F6);
  static const Color secondary = Color(0xFFFFBB91);
  static const Color accent = Color(0xFFFF8E6E);
  static const Color normal = Color(0xFF515070);
  static const Color yellow = Color(0xffFDC054);
  static const Color darkGrey = Color(0xff202020);
  static const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
  static const String BASE_URL = "http://13.214.65.164:3000";
  static const String API_URL = "$BASE_URL/api";
  static const String SHOP_ID = "610fd68647b7a33ec0ea5d10";


  static Map<String,String> headers = {"content-type":"application/json"};
  static Map<String,String> tokenHeader = {
    "content-type":"application/json",
    "authorization" : "Bearer ${user?.token}"
  };

  static List<Category> categories = [];

  static User? user;

  static String sarTar = """
  Finally, we have PageTransformer like android, just set a transformer to Swiper, it returns a widget that has been transformed. For now, only support for layout DEFAULT. Thanks to @FlutterRocks ,you've done great job""";


}