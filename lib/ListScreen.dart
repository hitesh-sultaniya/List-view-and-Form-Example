import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';


class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tour Planner'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(FontAwesomeIcons.search),
            onPressed: (){},
          ),
        ],
      ),
      body: new Center(
          child: new Scaffold(
            floatingActionButton: new FloatingActionButton(
              child: new Icon(FontAwesomeIcons.plus),
              onPressed: (){},
            ),
          ),
    ),
    );
  }
}