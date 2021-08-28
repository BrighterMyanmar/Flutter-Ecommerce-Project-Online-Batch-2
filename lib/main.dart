import 'package:commerce/pages/Flash.dart';
import 'package:commerce/pages/Preview.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    routes: {
      "/":(context) => Flash(),
      "/preview" : (context) => Preview()
    },
  ));
}
