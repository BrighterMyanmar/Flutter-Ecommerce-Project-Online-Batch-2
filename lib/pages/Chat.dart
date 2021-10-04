import 'dart:convert';
import 'dart:io';

import 'package:commerce/models/Message.dart';
import 'package:commerce/utils/Constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http/http.dart' as http;

class Chat extends StatefulWidget {
  const Chat({Key? key}) : super(key: key);

  @override
  _ChatState createState() => _ChatState();
}

class _ChatState extends State<Chat> {
  List<Message> chats = [];
  final ImagePicker _picker = ImagePicker();
  File? file;

  _emitMessage(msg, type) {
    var sendMsg = new Map();
    sendMsg["from"] = Constants.user?.id;
    sendMsg["to"] = Constants.SHOP_ID;
    sendMsg["type"] = type;
    sendMsg["msg"] = msg;
  }

  @override
  Widget build(BuildContext context) {
    var _sacffoldKey = GlobalKey<ScaffoldState>();
    var _textInputController = TextEditingController();
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _sacffoldKey,
      appBar:
          AppBar(centerTitle: true, title: Text("Chat With Customer Service")),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            itemCount: 100,
            itemBuilder: (context, index) {
              if (index % 4 == 0) {
                return _makeLeftTextContainer(mSize);
              } else if (index % 4 == 1) {
                return _makeLeftImageContainer(mSize);
              } else if (index % 4 == 2) {
                return _makeRightTextContainer(mSize);
              }
              return _makeRightImageContainer(mSize);
            },
          )),
          Container(
            height: 50,
            color: Constants.normal,
            child: Row(
              children: [
                InkWell(
                    onTap: () => _getImage(),
                    child: Icon(Icons.file_copy,
                        size: 35, color: Constants.primary)),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: TextFormField(
                      controller: _textInputController,
                      decoration: InputDecoration(
                        labelStyle:
                            TextStyle(color: Constants.primary, fontSize: 16),
                        enabledBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Constants.primary)),
                        focusedBorder: OutlineInputBorder(
                            borderSide: BorderSide(color: Constants.primary)),
                      ),
                    ),
                  ),
                ),
                InkWell(
                    onTap: () {
                      _emitMessage(_textInputController.text, "text");
                      _textInputController.text = "";
                    },
                    child:
                        Icon(Icons.send, size: 35, color: Constants.primary)),
              ],
            ),
          )
        ],
      ),
    );
  }

  Widget _makeLeftTextContainer(mSize) {
    return Row(
      children: [
        Container(
          margin: EdgeInsets.only(left: 20, top: 20),
          padding: EdgeInsets.all(10.0),
          width: (mSize.width / 3) * 2,
          decoration: BoxDecoration(
              color: Constants.secondary,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text("Username",
                    style: TextStyle(
                        color: Constants.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Text(Constants.sarTar, style: TextStyle(color: Constants.normal)),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("20-0802021",
                        style: TextStyle(color: Constants.primary))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _makeRightTextContainer(mSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
          margin: EdgeInsets.only(right: 20, top: 20),
          padding: EdgeInsets.all(10.0),
          width: (mSize.width / 3) * 2,
          decoration: BoxDecoration(
              color: Constants.accent,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              )),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 10, bottom: 10),
                child: Text("Username",
                    style: TextStyle(
                        color: Constants.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Text(Constants.sarTar, style: TextStyle(color: Constants.normal)),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("20-0802021",
                        style: TextStyle(color: Constants.primary))
                  ],
                ),
              )
            ],
          ),
        ),
      ],
    );
  }

  Widget _makeLeftImageContainer(mSize) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Constants.darkGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.asset(
              "assets/images/bur.png",
              width: 200,
            ))
      ],
    );
  }

  Widget _makeRightImageContainer(mSize) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(right: 20, top: 20),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Constants.darkGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.asset(
              "assets/images/bur.png",
              width: 200,
            )),
      ],
    );
  }

  _uploadImage() async {
    var galleryUri = Uri.parse("${Constants.BASE_URL}/gallery");
    http.MultipartRequest request =
        new http.MultipartRequest("POST", galleryUri);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath("image", file?.path ?? "");
    request.files.add(multipartFile);

    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode((value));
        _emitMessage(resData["imgLink"], "image");
      });
    });
  }

  Future _getImage() async {
    final result = await _picker.pickImage(source: ImageSource.gallery);
    if (result != null) {
      print("${result.path}");
      file = File(result.path);
      _uploadImage();
    } else {
      // User canceled the picker
    }
  }
}
