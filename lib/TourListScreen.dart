import 'package:flutter/material.dart';
import 'utils/CustomNavigator.dart';


class TourListScreen extends StatefulWidget {
  @override
  _TourListScreenState createState() => _TourListScreenState();
}

class _TourListScreenState extends State<TourListScreen> {

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Tour List'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.search),
            onPressed: (){
            },
          ),
          IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              TourNavigator.goToAddTourScreen(context);
            },
          ),
        ],
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          autovalidate: false,
          child: new SingleChildScrollView(
            padding: const EdgeInsets.symmetric(horizontal: 5.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 10.0),
              ],
            ),
          ),
        ),
       ),
    );
  }
}