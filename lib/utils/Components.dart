import 'package:commerce/models/Product.dart';
import 'package:commerce/pages/Cart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'Constants.dart';

class Components {
  static List<Product> cartProducts = [];

  static Widget getShoppingCart(context) {
    return InkWell(
      onTap: () => Navigator.push(
          context, MaterialPageRoute(builder: (context) => Cart())),
      child: Stack(
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
                  borderRadius: BorderRadius.all(Radius.circular(25))),
              child: Center(
                  child: Text("${cartProducts.length}",
                      style: TextStyle(color: Colors.white))),
            ),
          )
        ],
      ),
    );
  }

  static addToCard(product) {
    bool exist = false;
    if (cartProducts.length > 0) {
      cartProducts.forEach((prod) {
        if (prod.id == product.id) {
          exist = true;
          prod.count++;
        }
      });
      if (!exist) {
        cartProducts.add(product);
      }
    } else {
      cartProducts.add(product);
    }
  }

  static reduceProductCount(product) {
    cartProducts.forEach((pro) {
      if (pro.id == product.id) {
        if (pro.count > 1) {
          pro.count--;
        }
      }
    });
  }

  static removeProduct(product) {
    cartProducts.removeWhere((pro) => pro.id == product.id);
  }

  static int getProductTotal() {
    int total = 0;
    cartProducts.forEach((product) {
      total += product.count * (product.price ?? 0);
    });
    return total;
  }

  static generateOrder() {
    List<Map> cartList = [];
    cartProducts.forEach((product) {
      var map = new Map();
      map["id"] = product.id;
      map["count"] = product.count;
      cartList.add(map);
    });
    return cartList;
  }
}
