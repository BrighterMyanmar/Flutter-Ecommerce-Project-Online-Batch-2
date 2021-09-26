import 'package:commerce/pages/Chat.dart';
import 'package:commerce/pages/Flash.dart';
import 'package:commerce/pages/HistoryPage.dart';
import 'package:commerce/pages/Home.dart';
import 'package:commerce/pages/Login.dart';
import 'package:commerce/pages/Preview.dart';
import 'package:commerce/pages/Register.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/": (context) => Flash(),
      "/login": (context) => Login(),
      "/register": (context) => Register(),
      "/historypage": (context) => HistoryPage()
    },
  ));
}
