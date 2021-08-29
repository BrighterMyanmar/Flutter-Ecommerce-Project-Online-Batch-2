import 'package:commerce/helper/ArchPainter.dart';
import 'package:commerce/pages/Detail.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  var cartCount = 0;
  @override
  Widget build(BuildContext context) {
    var msize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Preview"),
          actions: [
            Stack(
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
                    width:25,
                    height:25,
                    decoration: BoxDecoration(
                      color: Constants.normal,
                      borderRadius: BorderRadius.all(Radius.circular(25))
                    ),
                    child: Center(child: Text("$cartCount")),
                  ),
                )
              ],
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(painter: ArchPainter(msize)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text("Big Burger",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Constants.normal,
                          fontFamily: "English")),
                ),
                SizedBox(height: 20),
                Center(child: Image.asset("assets/images/bur.png", width: 250)),
                SizedBox(height: 20),
                _buildRichText("Price\n", "\t\t\t\t\t\t\t3500 Ks"),
                SizedBox(height: 20),
                _buildRichText("Size\n", "\t\t\t\t\t\t\tLarge Size"),
                SizedBox(height: 20),
                _buildRichText("Promo\n", "\t\t\t\t\t\t\tCoca Cola"),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        onPressed: () {
                          setState(() {
                            cartCount++;
                          });
                        },
                        color: Constants.normal,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            children: [
                              Icon(Icons.shopping_cart, color: Colors.white),
                              SizedBox(width: 10),
                              Text("Buy Now",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "English",
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        )),
                    RaisedButton(
                        onPressed: () => Navigator.push(context,
                            MaterialPageRoute(builder: (context) => Detail())),
                        color: Constants.normal,
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(20))),
                        child: Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10, vertical: 15),
                          child: Row(
                            children: [
                              SvgPicture.asset("assets/icons/eye.svg",
                                  color: Colors.white),
                              SizedBox(width: 20),
                              Text("Detail...",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: "English",
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                        ))
                  ],
                )
              ]),
            ],
          ),
        ));
  }

  Widget _buildRichText(price, discount) {
    return Padding(
      padding: const EdgeInsets.only(left: 30),
      child: RichText(
          text: TextSpan(children: [
        TextSpan(
            text: price, style: TextStyle(fontSize: 45, fontFamily: "English")),
        TextSpan(
            text: discount,
            style: TextStyle(
                fontSize: 20, fontFamily: "English", color: Constants.normal))
      ])),
    );
  }
}
