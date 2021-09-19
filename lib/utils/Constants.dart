import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:commerce/models/User.dart';
import 'package:commerce/models/Product.dart';

class Constants{
  static const Color primary = Color(0xFFF6F6F6);
  static const Color secondary = Color(0xFFFFBB91);
  static const Color accent = Color(0xFFFF8E6E);
  static const Color normal = Color(0xFF515070);
  static const Color yellow = Color(0xffFDC054);
  static const Color darkGrey = Color(0xff202020);
  static const Color transparentYellow = Color.fromRGBO(253, 184, 70, 0.7);
  static const String BASE_URL = "http://13.214.51.219:3000";

  static Map<String,String> headers = {"content-type":"application/json"};

  static List<Product> cartProducts = [];

  static addToCard(product){
    bool exist = false;
    if(cartProducts.length > 0){
        cartProducts.forEach((prod) {
            if(prod.id == product.id) {
                exist = true;
                prod.count++;
            }
        });
        if(!exist){
            cartProducts.add(product);
        }
    }else{
        cartProducts.add(product);
    }
  }

  static User? user;

  static String sarTar = """
  Finally, we have PageTransformer like android, just set a transformer to Swiper, it returns a widget that has been transformed. For now, only support for layout DEFAULT. Thanks to @FlutterRocks ,you've done great job""";

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
                                       child: Text("${cartProducts.length}",
                                           style: TextStyle(color: Colors.white))),
                                 ),
                               )
                             ],
                           );
  }

  static List<Product> shopProducts = [
    new Product(id:"1",name:"Shoe",image:"1.jpg",price:2000),
        new Product(id:"2",name:"Item 2",image:"2.jpg",price:3000),
        new Product(id:"3",name:"Item 3",image:"3.jpg",price:4000),
        new Product(id:"4",name:"Item 4",image:"4.jpg",price:5000),
        new Product(id:"5",name:"Item 5",image:"5.jpg",price:6000),
        new Product(id:"6",name:"Item 6",image:"bur.png",price:7000),
        new Product(id:"7",name:"Item 7",image:"delivery.png",price:8000),
        new Product(id:"8",name:"Item 8",image:"fm.png",price:9000),
        new Product(id:"9",name:"Item 9",image:"warranty.png",price:10000),
        new Product(id:"10",name:"Item 10",image:"bur.png",price:20000),
  ];

}