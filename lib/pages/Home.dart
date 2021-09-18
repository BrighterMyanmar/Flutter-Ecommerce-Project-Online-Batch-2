import 'package:card_swiper/card_swiper.dart';
import 'package:commerce/pages/ProductPage.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var imgList = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text("Home Page"),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: InkWell(
                  onTap: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Product())),
                  child: Icon(Icons.home, size: 35)),
            )
          ],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              _makeTitleBar(mSize, "Tags"),
              SizedBox(height: 10),
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
                  // pagination: SwiperPagination(),
                  control: SwiperControl(),
                  autoplay: true,
                  duration: 1000,
                ),
              ),
              SizedBox(height: 10),
              _makeTitleBar(mSize, "Categories"),
              SizedBox(height: 10),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, index) =>
                      _buildCategory(index))
            ],
          ),
        ));
  }

  Widget _buildCategory(ind) {
    return Container(
        height: 100,
        child: Card(child: Image.asset("assets/images/${(ind % 5) + 1}.jpg")));
  }

  Container _makeTitleBar(mSize, text) {
    return Container(
      padding: EdgeInsets.fromLTRB(20, 8, 0, 0),
      width: mSize.width,
      height: 55,
      decoration: BoxDecoration(
          color: Constants.secondary,
          borderRadius: BorderRadius.only(topRight: Radius.circular(90))),
      child: Text(text,
          style: TextStyle(
              color: Constants.normal,
              fontSize: 30,
              fontWeight: FontWeight.bold,
              fontFamily: "English")),
    );
  }
}
