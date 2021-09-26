import 'package:commerce/helper/TrianglePainter.dart';
import 'package:commerce/pages/Home.dart';
import 'package:commerce/utils/Api.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class Flash extends StatefulWidget {
  const Flash({Key? key}) : super(key: key);

  @override
  _FlashState createState() => _FlashState();
}

class _FlashState extends State<Flash> {
  loadInitialData() async {
    bool bol = await Api.getCategories();
    if (bol) {
      Navigator.push(context, MaterialPageRoute(builder: (context) => Home()));
    }
  }

  @override
  void initState() {
    super.initState();
    loadInitialData();
  }

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          CustomPaint(
            painter: TrianglePainter(mSize),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        "Food Monkey",
                        style: TextStyle(
                            color: Constants.normal,
                            fontSize: 45,
                            fontFamily: "English",
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 120),
                Image.asset("assets/images/fm.png"),
                SizedBox(height: 120),
                CircularProgressIndicator()
              ],
            ),
          )
        ],
      ),
    );
  }
}
