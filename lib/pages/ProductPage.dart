import 'package:commerce/models/Product.dart';
import 'package:commerce/pages/Preview.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/material.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({Key? key}) : super(key: key);

  @override
  _ProductPageState createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {
  List<String> items = [
    "Popular",
    "Flash Sale",
    "Most Wishes",
    "Promotion",
    "Discount",
    "Spring Special"
  ];

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Products"),
          actions: [Constants.getShoppingCart()],
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 30,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: items.length,
                    itemBuilder: (context, index) =>
                        _buildTitleTab(index, items[index])),
              ),
              GridView.builder(
                  shrinkWrap: true,
                  itemCount: Constants.shopProducts.length,
                  physics: ScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: (context, ind) =>
                      _buildProduct(Constants.shopProducts[ind]))
            ],
          ),
        ));
  }

  Widget _buildTitleTab(index, tag) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: InkWell(
        onTap: () {
          setState(() {
            currentIndex = index;
          });
        },
        child: Column(children: [
          Text(tag,
              style: TextStyle(
                  fontSize: 20,
                  color: Constants.normal,
                  fontWeight: FontWeight.bold)),
          SizedBox(height: 4),
          Container(
            height: 3,
            width: 60,
            decoration: BoxDecoration(
                color: index == currentIndex
                    ? Constants.accent
                    : Colors.transparent),
          )
        ]),
      ),
    );
  }

  Widget _buildProduct(Product product) {
    return Container(
      child: Card(
        child: Column(
          children: [
            SizedBox(height: 5),
            Text(product.name ?? "",
                style: TextStyle(
                    fontFamily: "English",
                    color: Constants.normal,
                    fontSize: 30,
                    fontWeight: FontWeight.bold)),
            Image.asset("assets/images/${product.image}", height: 100),
            SizedBox(height: 5),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                InkWell(
                    onTap: () {
                      setState(() {
                        Constants.addToCard(product);
                      });
                    },
                    child: Icon(Icons.shopping_cart,
                        color: Constants.accent, size: 30)),
                Text("${product.price ?? 0} Ks",
                    style: TextStyle(
                        fontFamily: "English",
                        color: Constants.normal,
                        fontSize: 20,
                        fontWeight: FontWeight.bold)),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => Preview(product: product)));
                    },
                    child: Icon(Icons.remove_red_eye,
                        color: Constants.accent, size: 30))
              ],
            )
          ],
        ),
      ),
    );
  }
}
