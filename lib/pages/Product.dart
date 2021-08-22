import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class Product extends StatefulWidget {
  const Product({Key? key}) : super(key: key);

  @override
  _ProductState createState() => _ProductState();
}

class _ProductState extends State<Product> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Text("Tabs"),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: 20,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, ind) => _buildProduct())
            ],
          ),
        ));
  }

  Widget _buildProduct() {
    return Container(
      child: Card(
        child: Column(
          children: [
            SizedBox(height: 5),
            Text("Big Burger",
                style: TextStyle(
                    fontFamily: "English",
                    color: Constants.normal,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Image.asset("assets/images/bur.png", width: 120),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Icon(Icons.shopping_cart,color:Constants.accent,size:30),
                Text("3500 Ks",
                    style: TextStyle(
                        fontFamily: "English",
                        color: Constants.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                Icon(Icons.remove_red_eye,color:Constants.accent,size:30)
              ],
            )
          ],
        ),
      ),
    );
  }
}
