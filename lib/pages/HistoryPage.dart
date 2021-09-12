import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Order Hisoty")),
        body: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) => _buildOrder()),
            )
          ],
        ));
  }

  Widget _buildOrder() {
    return Container(
        color: Constants.normal,
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("20-12-2020",
                  style: TextStyle(
                      color: Constants.primary,
                      fontFamily: "English",
                      fontWeight: FontWeight.bold,
                      fontSize: 16)),
              FlatButton(
                  onPressed: () {},
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(30))),
                  color: Constants.secondary,
                  child: Text("15,000",
                      style: TextStyle(color: Constants.primary, fontSize: 16)))
            ],
          ),
          children: [...List.generate(3, (index) => _buildOrderItem())],
        ));
  }

  Widget _buildOrderItem() {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Constants.accent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.asset("assets/images/bur.png", width: 80),
            Column(children: [
              Text("Burger Kig",
                  style: TextStyle(
                      color: Constants.primary,
                      fontFamily: "English",
                      fontWeight: FontWeight.bold,
                      fontSize: 26)),
              Text("3 * 3500",
                  style: TextStyle(
                      color: Constants.primary,
                      fontFamily: "English",
                      fontWeight: FontWeight.bold,
                      fontSize: 16))
            ]),
            FlatButton(
                onPressed: () {},
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(30))),
                color: Constants.normal,
                child: Text("15,000",
                    style: TextStyle(color: Constants.primary, fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
