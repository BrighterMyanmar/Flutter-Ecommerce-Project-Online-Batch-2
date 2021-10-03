import 'package:card_swiper/card_swiper.dart';
import 'package:commerce/models/Category.dart';
import 'package:commerce/models/Product.dart';
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
  var _scaffoldKey = GlobalKey<ScaffoldState>();
  var _drawerKey = GlobalKey();
  var imgList = ["1.jpg", "2.jpg", "3.jpg", "4.jpg", "5.jpg"];

  @override
  Widget build(BuildContext context) {
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _scaffoldKey,
      appBar: AppBar(
        backgroundColor: Colors.pinkAccent,
        title: Text("Home Page"),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
                onTap: () => Navigator.push(context,
                    MaterialPageRoute(builder: (context) => ProductPage())),
                child: Icon(Icons.home, size: 35)),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10),
            child: InkWell(
                onTap: () {
                  _scaffoldKey.currentState
                      ?.showSnackBar(new SnackBar(content: Text("Hello")));
                },
                child: Icon(Icons.person, size: 35)),
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
                itemCount: Constants.categories.length,
                physics: ScrollPhysics(),
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemBuilder: (context, index) =>
                    _buildCategory(Constants.categories[index]))
          ],
        ),
      ),
      drawer: _getMyDrawer(),
    );
  }

  Widget _getMyDrawer() {
    return Drawer(
      key: _drawerKey,
      child: ListView(
        children: [
          _buildDrawerHeader(),
          _buildListTitleWithIcon(context, Icons.home, "Home Page", "/login"),
          _buildListTitleWithIcon(
              context, Icons.person, "History Page", "/historypage"),
          _buildListTitleWithIcon(
              context, Icons.location_city, "Contact Us", "/login"),
          _buildListTitleWithIcon(
              context, Icons.location_city, "Contact Us", "/register"),
          _buildListTitleWithIcon(
              context, Icons.location_city, "Contact Us", "/login"),
          _buildListTitleWithIcon(
              context, Icons.location_city, "Contact Us", "/register"),
          _buildListTitleWithIcon(
              context, Icons.location_city, "Contact Us", "/login"),
        ],
      ),
    );
  }

  Widget _buildListTitleWithIcon(context, icon, text, page) {
    return ListTile(
      title: Column(
        children: [
          InkWell(
            onTap: () => Navigator.pushNamed(context, page),
            child: Row(
              children: [
                Icon(icon, color: Constants.accent),
                SizedBox(width: 20),
                Text(text, style: TextStyle(color: Constants.normal))
              ],
            ),
          ),
          SizedBox(height: 10),
          Container(height: 0.5, color: Constants.normal)
        ],
      ),
    );
  }

  Widget _buildDrawerHeader() {
    return DrawerHeader(
        decoration: BoxDecoration(color: Constants.normal),
        child: Column(children: [
          Image.asset("assets/images/fm.png", height: 100),
          Text("စိုးသူအောင်", style: TextStyle(color: Constants.primary))
        ]));
  }

  Widget _buildCategory(Category category) {
    return Container(
        height: 100,
        child: InkWell(
          onTap: () => Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => ProductPage(catid: category.id))),
          child: Card(
              child: Column(
            children: [
              SizedBox(height: 10),
              Text(category.name ?? ""),
              SizedBox(height: 10),
              Image.network("https://picsum.photos/250/200", scale: 1.5)
            ],
          )),
        ));
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
