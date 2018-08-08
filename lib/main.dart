import 'package:flutter/material.dart';
import 'HomeScreen.dart';
import 'NewLocationForm.dart';
import 'SplashScreen.dart';

var routes = <String, WidgetBuilder>{
  "/HomeScreen": (BuildContext context) => HomeScreen(),
  "/NewLocationForm" : (BuildContext context) => NewLocationForm(),
};


void main() {
  runApp(new MaterialApp(
    theme: new ThemeData(primaryColor: Colors.brown, accentColor: Colors.brown),
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes:routes
  ));
}

