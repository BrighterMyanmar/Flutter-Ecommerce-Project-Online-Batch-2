import 'package:commerce/helper/ArchPainter.dart';
import 'package:commerce/models/Product.dart';
import 'package:commerce/pages/Detail.dart';
import 'package:commerce/utils/Components.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Preview extends StatefulWidget {
  final Product? product;

  const Preview({Key? key, this.product}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState(product);
}

class _PreviewState extends State<Preview> {
  Product? product;

  _PreviewState(this.product);

  var cartCount = 0;

  @override
  Widget build(BuildContext context) {
    var msize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Product Preview"),
          actions: [Components.getShoppingCart(context)],
        ),
        body: SingleChildScrollView(
          child: Stack(
            children: [
              CustomPaint(painter: ArchPainter(msize)),
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20),
                  child: Text(product?.name ?? "",
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 45,
                          color: Constants.normal,
                          fontFamily: "English")),
                ),
                SizedBox(height: 20),
                Center(
                    child: Image.network("https://picsum.photos/300/200",
                        scale: 1)),
                SizedBox(height: 20),
                _buildRichText(
                    "Price\n", "\t\t\t\t\t\t\t ${product?.price ?? 0} Ks"),
                SizedBox(height: 20),
                _buildRichText(
                    "Size\n", "\t\t\t\t\t\t\t ${product?.size ?? 0}"),
                SizedBox(height: 20),
                _buildRichText(
                    "Promo\n", "\t\t\t\t\t\t\t ${product?.discount ?? 0}"),
                SizedBox(height: 30),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    RaisedButton(
                        onPressed: () {
                          setState(() {
                            Components.addToCard(product);
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
                        onPressed: () => Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    Detail(product: product))),
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
