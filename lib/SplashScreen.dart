import 'dart:async';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'utils/CustomNavigator.dart';


class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => new _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  startTime() async {
    var _duration = new Duration(seconds: 2);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() {
    TourNavigator.goToHome(context);
  }

  @override
  void initState() {
    super.initState();
    startTime();
  }

  @override
  Widget build(BuildContext context){
    return new Scaffold(
      body: new Center(
        child: new IconTheme(
    data: new IconThemeData(
        color: Colors.brown,
        size : 200.0
        ), 
    child: new Icon(FontAwesomeIcons.suitcase),
        )
    )
    );
  } 
}
