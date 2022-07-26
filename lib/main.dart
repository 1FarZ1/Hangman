import 'package:flutter/material.dart';
import 'package:game/Screens/home.dart';
import 'package:game/Screens/menu.dart';
import 'package:flutter/services.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    initialRoute: "/",
    routes: {
      "/": ((context) {
        return Menu();
      }),
      "/home": ((context) {
        return Home();
      }),
    },
  ));
}
