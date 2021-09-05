import 'package:card_swiper/card_swiper.dart';
import 'package:commerce/pages/Cart.dart';
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
        body: SingleChildScrollView(
            child: Column(
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
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text("Big Burger",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                        color: Constants.normal,
                        fontFamily: "English")),
                InkWell(
                  onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context)=> Cart())),
                  child:Constants.getShoppingCart(),
                )
              ],
            ),
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildRichText("Price\n", "\t\t\t\t3500 Ks"),
                _buildRichText("Size\n", "\t\t\tLarge Size"),
                _buildRichText("Promo\n", "\t\t\tCoca Cola"),
              ],
            ),
            _makePara(Constants.sarTar),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Table(
                border: TableBorder.all(color: Constants.normal),
                children: [
                  TableRow(children: [
                    _buildTableTitle("Features"),
                    _buildTableTitle("Values")
                  ]),
                  _buildTableContent("Size", "Large Size"),
                  _buildTableContent("Price", "3500Ks"),
                  _buildTableContent("Discount", "0Ks"),
                ],
              ),
            ),
            _makePara(Constants.sarTar),
            _buildTextAndCard("Delivery","assets/images/delivery.png"),
            _buildTextAndCard("Warranty","assets/images/warranty.png")
          ],
        )));
  }

  Widget _buildTextAndCard(text,image) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Text(text,style:TextStyle(fontSize: 25,
            fontFamily: "English",
            fontWeight: FontWeight.bold)),
        SizedBox(height: 15),
        Image.asset(image)
      ]),
    );
  }

  Widget _buildTableTitle(name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
          child: Text(name,
              style: TextStyle(
                  color: Constants.secondary,
                  fontSize: 20,
                  fontWeight: FontWeight.bold))),
    );
  }

  TableRow _buildTableContent(name, value) {
    return TableRow(children: [
      _buildTableContentInner(name),
      _buildTableContentInner(value)
    ]);
  }

  Widget _buildTableContentInner(name) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Center(
        child: Text(name,
            style: TextStyle(
              color: Constants.normal,
              fontSize: 16,
            )),
      ),
    );
  }

  Widget _buildRichText(price, discount) {
    return RichText(
        text: TextSpan(children: [
      TextSpan(
          text: price,
          style: TextStyle(
              fontSize: 35, color: Constants.normal, fontFamily: "English")),
      TextSpan(
          text: discount,
          style: TextStyle(
              fontSize: 16, fontFamily: "English", color: Constants.accent))
    ]));
  }

  Widget _makePara(text) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Text(text,
          textAlign: TextAlign.justify,
          style: TextStyle(
              fontSize: 17, fontFamily: "English", color: Constants.normal)),
    );
  }
}
