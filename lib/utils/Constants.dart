import 'package:flutter/material.dart';

class Constants{
  static const Color primary = Color(0xFFF6F6F6);
  static const Color secondary = Color(0xFFFFBB91);
  static const Color accent = Color(0xFFFF8E6E);
  static const Color normal = Color(0xFF515070);
  static const Color yellow = Color(0xffFDC054);
  static const Color darkGrey = Color(0xff202020);
  static const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);

  static String sarTar = """
  Finally, we have PageTransformer like android, just set a transformer to Swiper, it returns a widget that has been transformed. For now, only support for layout DEFAULT. Thanks to @FlutterRocks ,you've done great job
  """;

  static Widget getShoppingCart(){
  return Stack(
                             children: [
                               Padding(
                                 padding: const EdgeInsets.fromLTRB(0, 10, 20, 0),
                                 child: SvgPicture.asset(
                                   "assets/icons/cart.svg",
                                   color: Constants.accent,
                                   width: 40,
                                 ),
                               ),
                               Positioned(
                                 right: 12,
                                 child: Container(
                                   width: 25,
                                   height: 25,
                                   decoration: BoxDecoration(
                                       color: Constants.normal,
                                       borderRadius:
                                           BorderRadius.all(Radius.circular(25))),
                                   child: Center(
                                       child: Text("11",
                                           style: TextStyle(color: Colors.white))),
                                 ),
                               )
                             ],
                           );
  }

}