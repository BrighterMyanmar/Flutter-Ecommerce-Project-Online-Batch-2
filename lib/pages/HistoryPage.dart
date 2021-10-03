import 'package:commerce/models/History.dart';
import 'package:commerce/models/OrderItem.dart';
import 'package:commerce/utils/Api.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class HistoryPage extends StatefulWidget {
  const HistoryPage({Key? key}) : super(key: key);

  @override
  _HistoryPageState createState() => _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  List<History> histories = [];

  _loadMyOrders() async {
    histories = await Api.getMyOrders();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadMyOrders();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: Text("Your Order Hisoty")),
        body: histories.length > 0
            ? Column(
                children: [
                  Expanded(
                    child: ListView.builder(
                        itemCount: histories.length,
                        itemBuilder: (context, index) =>
                            _buildOrder(histories[index])),
                  )
                ],
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [Center(child: CircularProgressIndicator())],
              ));
  }

  Widget _buildOrder(History history) {
    return Container(
        color: Constants.normal,
        child: ExpansionTile(
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Text("${history.created?.split("T")[0]}",
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
                  child: Text("${history.total}",
                      style: TextStyle(color: Constants.primary, fontSize: 16)))
            ],
          ),
          children: [
            ...List.generate(
                history.items?.length ?? 0,
                (index) =>
                    _buildOrderItem(history?.items?[index] ?? new OrderItem()))
          ],
        ));
  }

  Widget _buildOrderItem(OrderItem orderItem) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 20),
      child: Card(
        color: Constants.accent,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Image.network("${orderItem.images?[0]}", width: 80),
            Column(children: [
              Text("${orderItem?.name}",
                  style: TextStyle(
                      color: Constants.primary,
                      fontFamily: "English",
                      fontWeight: FontWeight.bold,
                      fontSize: 26)),
              Text("${orderItem.count} * ${orderItem.price}",
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
                child: Text("${(orderItem?.count ?? 0) * (orderItem.price ?? 0)}",
                    style: TextStyle(color: Constants.primary, fontSize: 16)))
          ],
        ),
      ),
    );
  }
}
