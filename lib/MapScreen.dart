import 'package:flutter/material.dart';


class MapScreen extends StatefulWidget {
  @override
  _MapScreenState createState() => _MapScreenState();
}

class _MapScreenState extends State<MapScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Map'),
      ),
       body: new Center(
        child: new Text("Welcome to Map Screen. !")
      ),
    );
  }
}