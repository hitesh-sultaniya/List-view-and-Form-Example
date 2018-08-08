import 'package:flutter/material.dart';


class TourListScreen extends StatefulWidget {
  @override
  _TourListScreenState createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Tour List'),
      ),
       body: new Center(
        child: new Text("Welcome to Tour List Screen. !")
      ),
    );
  }
}