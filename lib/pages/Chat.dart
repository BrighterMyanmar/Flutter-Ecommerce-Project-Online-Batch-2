import 'dart:convert';
import 'dart:io';

import 'package:commerce/models/Message.dart';
import 'package:commerce/utils/Components.dart';
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

  ScrollController _scrollController =
      ScrollController(initialScrollOffset: 150);

  _emitMessage(msg, type) {
    var sendMsg = new Map();
    sendMsg["from"] = Constants.user?.id;
    sendMsg["to"] = Constants.SHOP_ID;
    sendMsg["type"] = type;
    sendMsg["msg"] = msg;
    Components.socket?.emit("message", sendMsg);
  }

  _invokeSocket() {
    Components.socket?.emit("load-more", "");
    Components.socket?.on("message", (data) {
      Message msg = Message.fromJson(data);
      chats.add(msg);
      setState(() {
        _scrollController.animateTo(
            _scrollController.position.maxScrollExtent + 200,
            duration: Duration(seconds: 1),
            curve: Curves.fastOutSlowIn);
      });
    });
    Components.socket?.on("messages", (data) {
      print(data);
      List lisy = data as List;
      chats = lisy.map((e) => Message.fromJson(e)).toList();
      print(chats.length);
      setState(() {});
    });
  }

  @override
  void initState() {
    super.initState();
    _invokeSocket();
  }

  @override
  Widget build(BuildContext context) {
    var _sacffoldKey = GlobalKey<ScaffoldState>();
    var _textInputController = TextEditingController(text: "Hello Server");
    var mSize = MediaQuery.of(context).size;
    return Scaffold(
      key: _sacffoldKey,
      appBar:
          AppBar(centerTitle: true, title: Text("Chat With Customer Service")),
      body: Column(
        children: [
          Expanded(
              child: ListView.builder(
            // reverse: true,
            controller: _scrollController,
            itemCount: chats.length,
            itemBuilder: (context, index) {
              Message msg = chats[index];
              if (msg.from?.id == Constants.SHOP_ID) {
                // Right
                if (msg.type == "text") {
                  return _makeRightTextContainer(mSize, msg);
                } else {
                  return _makeRightImageContainer(mSize, msg);
                }
              } else {
                // Left
                if (msg.type == "text") {
                  return _makeLeftTextContainer(mSize, msg);
                } else {
                  return _makeLeftImageContainer(mSize, msg);
                }
              }
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
                            TextStyle(color: Colors.white, fontSize: 16),
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

  Widget _makeLeftTextContainer(mSize, Message msg) {
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
                child: Text("${msg.from?.name}",
                    style: TextStyle(
                        color: Constants.normal,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Text("${msg.msg}", style: TextStyle(color: Constants.normal)),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${msg.created!.split("T")[0]}",
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

  Widget _makeRightTextContainer(mSize, Message msg) {
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
                child: Text("${msg.from?.name}",
                    style: TextStyle(
                        color: Constants.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)),
              ),
              Text("${msg.msg}", style: TextStyle(color: Constants.normal)),
              Padding(
                padding: const EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text("${msg.created!.split("T")[0]}",
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

  Widget _makeLeftImageContainer(mSize, Message msg) {
    return Row(
      children: [
        Container(
            margin: EdgeInsets.only(left: 20, top: 20),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Constants.darkGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.network(
              "${msg.msg}",
              width: 200,
            ))
      ],
    );
  }

  Widget _makeRightImageContainer(mSize, Message msg) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Container(
            margin: EdgeInsets.only(right: 20, top: 20),
            padding: EdgeInsets.all(10.0),
            decoration: BoxDecoration(
                color: Constants.darkGrey,
                borderRadius: BorderRadius.all(Radius.circular(10))),
            child: Image.network(
              "${msg.msg}",
              width: 200,
            )),
      ],
    );
  }

  _uploadImage() async {
    var galleryUri = Uri.parse("${Constants.API_URL}/imageupload");
    http.MultipartRequest request =
        new http.MultipartRequest("POST", galleryUri);
    http.MultipartFile multipartFile =
        await http.MultipartFile.fromPath("image", file?.path ?? "");
    request.files.add(multipartFile);
    request.headers["Authorization"] = "Bearer ${Constants.user?.token}";

    await request.send().then((response) async {
      response.stream.transform(utf8.decoder).listen((value) {
        var resData = jsonDecode((value));
        _emitMessage(resData["msg"], "image");
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
