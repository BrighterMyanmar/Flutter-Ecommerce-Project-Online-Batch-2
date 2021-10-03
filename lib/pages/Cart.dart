import 'package:commerce/models/Product.dart';
import 'package:commerce/pages/HistoryPage.dart';
import 'package:commerce/utils/Api.dart';
import 'package:commerce/utils/Components.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Cart extends StatefulWidget {
  const Cart({Key? key}) : super(key: key);

  @override
  _CartState createState() => _CartState();
}

class _CartState extends State<Cart> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Cart")),
        body: Column(
          children: [
            Expanded(
                child: ListView.builder(
                    itemCount: Components.cartProducts.length,
                    itemBuilder: (context, index) =>
                        _buildCartItem(Components.cartProducts[index]))),
            Container(
              height: 150,
              padding: EdgeInsets.only(top: 20),
              decoration: BoxDecoration(
                color: Constants.secondary,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20)),
              ),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("Sub Total",
                          style: TextStyle(
                              color: Constants.primary,
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              fontFamily: "English")),
                      SizedBox(width: 20),
                      Text("${Components.getProductTotal()} Ks",
                          style: TextStyle(
                              color: Constants.normal,
                              fontFamily: "English",
                              fontWeight: FontWeight.bold,
                              fontSize: 30))
                    ],
                  ),
                  SizedBox(height: 20),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        RaisedButton(
                            onPressed: () async {
                              if (Constants.user == null) {
                                Navigator.pushNamed(context, "/login");
                              } else {
                                bool bol = await Api.orderUpload(
                                    items: Components.generateOrder());
                                if (bol) {
                                  Components.cartProducts = [];
                                  Fluttertoast.showToast(
                                      msg: "Order Upload Success",
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.CENTER,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0);
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => HistoryPage()));
                                }
                              }
                            },
                            color: Constants.normal,
                            shape: RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(20))),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 10, vertical: 15),
                              child: Text("Order Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "English",
                                      fontSize: 20,
                                      fontWeight: FontWeight.bold)),
                            ))
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ));
  }

  Widget _buildCartItem(Product product) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
      child: Card(
        // color: Colors.white,
        child: Stack(
          overflow: Overflow.visible,
          children: [
            Positioned(
              right: -10,
              top: -10,
              child: Container(
                height: 25,
                width: 25,
                decoration: BoxDecoration(
                    shape: BoxShape.circle, color: Constants.secondary),
                child: InkWell(
                    onTap: () {
                      Components.removeProduct(product);
                      setState(() {});
                    },
                    child: Icon(Icons.clear, color: Colors.white)),
              ),
            ),
            Container(
                height: 100,
                margin: EdgeInsets.symmetric(vertical: 5),
                padding: EdgeInsets.all(5),
                // decoration: BoxDecoration(color: Constants.primary),
                child: Row(
                  children: [
                    Image.network("${product.images?[0]}"),
                    SizedBox(width: 10),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("${product.name}",
                            style: TextStyle(
                                color: Constants.normal,
                                fontFamily: "English",
                                fontSize: 25,
                                fontWeight: FontWeight.bold)),
                        SizedBox(height: 15),
                        Row(
                          children: [
                            SizedBox(width: 10),
                            RichText(
                                text: TextSpan(
                                    style: TextStyle(
                                        color: Constants.normal,
                                        fontFamily: "English",
                                        fontSize: 14,
                                        fontStyle: FontStyle.italic),
                                    children: [
                                  TextSpan(text: "Price ${product.price}\n"),
                                  TextSpan(
                                      text:
                                          "Total ${(product.price ?? 0) * product.count}")
                                ])),
                            SizedBox(width: 20),
                            Row(
                              children: [
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Constants.normal,
                                      shape: BoxShape.circle),
                                  child: InkWell(
                                    onTap: () {
                                      Components.reduceProductCount(product);
                                      setState(() {});
                                    },
                                    child: Icon(Icons.remove,
                                        color: Constants.primary),
                                  ),
                                ),
                                SizedBox(width: 5),
                                Text("${product.count}".padLeft(2, "0"),
                                    style: TextStyle(
                                        fontSize: 20, color: Constants.normal)),
                                SizedBox(width: 5),
                                Container(
                                  width: 30,
                                  height: 30,
                                  decoration: BoxDecoration(
                                      color: Constants.normal,
                                      shape: BoxShape.circle),
                                  child: GestureDetector(
                                      onTap: () {
                                        Components.addToCard(product);
                                        setState(() {});
                                      },
                                      child: Icon(Icons.add,
                                          color: Constants.primary)),
                                )
                              ],
                            )
                          ],
                        )
                      ],
                    )
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
