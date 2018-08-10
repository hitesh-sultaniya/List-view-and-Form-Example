import 'package:flutter/material.dart';
import 'TourListScreen.dart';
import 'NewLocationForm.dart';
import 'ListScreen.dart';
import 'SplashScreen.dart';

var routes = <String, WidgetBuilder>{
  "/TourListScreen": (BuildContext context) => TourListScreen(),
  "/ListScreen": (BuildContext context) => ListScreen(),
  "/NewLocationForm" : (BuildContext context) => NewLocationForm(),
};


void main() {
  runApp(new MaterialApp(
    title: 'Tour Path',
    theme: new ThemeData(primaryColor: Colors.blueGrey, accentColor: Colors.blueAccent),
    debugShowCheckedModeBanner: false,
    home: new SplashScreen(),
    routes:routes
  ));
}

