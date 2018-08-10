import 'package:flutter/material.dart';
import 'utils/CustomNavigator.dart';


class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  TextFormField _tourName = new TextFormField(
              decoration: const InputDecoration(
                  border: UnderlineInputBorder(),
                  filled: false,
                  icon: Icon(Icons.location_on),
                  labelText: 'Tour Name *',
                ),
            );

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Add New Tour'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.add),
            onPressed: (){
              TourNavigator.goToLocationForm(context);
            },
          ),
          FlatButton(
            child: new Text(
              'Save',
              textScaleFactor: 1.25,
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
          )
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
                _tourName,
              ],
            ),
          ),
        ),
       ),
    );
  }
}