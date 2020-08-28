import 'package:flutter/material.dart';
import 'LoginPage.dart';
import 'HomePage.dart';
import 'LoadingPage.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';

void main(){
  runApp(MaterialApp(
    title: "Carmics",
    initialRoute: '/',
    routes: {
      // When navigating to the "/" route, build the FirstScreen widget.
      '/': (context) => LoadingPage(),
      // When navigating to the "/second" route, build the SecondScreen widget.
      '/Login': (context) => LoginPage(),
      '/Home':(context) => HomePage(),
    },
  ));
}











