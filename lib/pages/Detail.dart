import 'package:card_swiper/card_swiper.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Detail extends StatefulWidget {
  const Detail({Key? key}) : super(key: key);

  @override
  _DetailState createState() => _DetailState();
}

class _DetailState extends State<Detail> {
  var imgList = ["bur.png", "bur.png", "bur.png"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Product Detial")),
        body: Column(
          children: [
            Container(
              height: 150,
              child: Swiper(
                itemBuilder: (BuildContext context, int index) {
                  return Image.asset(
                    "assets/images/${imgList[index]}",
                    fit: BoxFit.contain,
                  );
                },
                itemCount: imgList.length,
                // control: SwiperControl(),
                autoplay: true,
                viewportFraction: 0.5,
                scale: 0.5,
                duration: 1000,
              ),
            ),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
              Text("Big Burger",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                      color: Constants.normal,
                      fontFamily: "English")),
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
                      child: Center(child: Text("11",style:TextStyle(color:Colors.white))),
                    ),
                  )
                ],
              )
            ],),
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              _buildRichText("Price\n", "\t\t\t\t3500 Ks"),
              _buildRichText("Size\n", "\t\t\tLarge Size"),
              _buildRichText("Promo\n", "\t\t\tCoca Cola"),
            ],),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Text(Constants.sarTar,textAlign: TextAlign.justify,style:TextStyle(
                  fontSize: 17,
                  fontFamily: "English",
                  color: Constants.normal)),
            )
          ],
        ));
  }

  Widget _buildRichText(price, discount) {
    return RichText(
        text: TextSpan(children: [
          TextSpan(
              text: price, style: TextStyle(fontSize: 35, color: Constants.normal ,fontFamily: "English")),
          TextSpan(
              text: discount,
              style: TextStyle(
                  fontSize: 16, fontFamily: "English", color: Constants.accent))
        ]));
  }
}
