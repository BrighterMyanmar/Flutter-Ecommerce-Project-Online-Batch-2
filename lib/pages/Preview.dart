import 'package:commerce/helper/ArchPainter.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class Preview extends StatefulWidget {
  const Preview({Key? key}) : super(key: key);

  @override
  _PreviewState createState() => _PreviewState();
}

class _PreviewState extends State<Preview> {
  @override
  Widget build(BuildContext context) {
    var msize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(title: Text("Product Preview")),
        body: Stack(
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
              Center(child: Image.asset("assets/images/bur.png", width: 300)),
              SizedBox(height:20),
              _buildRichText("Price\n", "\t\t\t\t\t\t\t3500 Ks"),
              SizedBox(height:20),
              _buildRichText("Size\n", "\t\t\t\t\t\t\tLarge Size"),
              SizedBox(height:20),
              _buildRichText("Promo\n", "\t\t\t\t\t\t\tCoca Cola"),
              Row(children: [
                RaisedButton(
                  onPressed: (){},
                  color: Constants.normal,
                  child: Text("Buy Now"),
                )
              ],)
            ] ),

          ],
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
