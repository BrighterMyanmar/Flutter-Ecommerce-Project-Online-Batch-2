import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

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
                    itemCount: 20,
                    itemBuilder: (context, index) => _buildCartItem())),
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
                      Text("350,000 Ks",
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
                            onPressed: () {},
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

  Widget _buildCartItem() {
    return Card(
      child: Stack(children: [
        Container(
            height: 100,
            decoration: BoxDecoration(color: Constants.primary),
            child: Row(children: [
              Image.asset("assets/images/bur.png"),
              Column(children: [
                Text("Burger with Beef"),
                Row(children: [
                  RichText(text: TextSpan(
                      style: TextStyle(
                          color: Constants.normal,
                        fontFamily: "English",
                        fontSize: 16
                      ),
                      children: [
                        TextSpan(text: "Price 3500 Ks\n"),
                        TextSpan(text: "Total 10500 Ks")
                      ]
                  )),
                  Row(children: [
                    Container(
                      width:30,
                      height:30,
                      decoration: BoxDecoration(
                        color: Constants.normal,
                        shape: BoxShape.circle
                      ),
                      child: Icon(Icons.remove,color:Constants.primary),
                    ),
                    Text("03"),
                    Container(
                      width:30,
                      height:30,
                      decoration: BoxDecoration(
                          color: Constants.normal,
                          shape: BoxShape.circle
                      ),
                      child: Icon(Icons.add,color:Constants.primary),
                    )
                  ],)
                ],)
              ],)
            ],)
        )
      ],),
    );
  }
}