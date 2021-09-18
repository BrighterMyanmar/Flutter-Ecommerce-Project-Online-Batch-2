import 'package:commerce/pages/Chat.dart';
import 'package:commerce/pages/Flash.dart';
import 'package:commerce/pages/Login.dart';
import 'package:commerce/pages/Preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context) => Chat(),
      "/preview" : (context) => Preview(),
      "/login" : (context) => Login()
    },
  ));
}
