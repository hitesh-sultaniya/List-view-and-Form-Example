import 'package:flutter/material.dart';

class NewLocationForm extends StatefulWidget {
  @override
  _NewLocationFormState createState() => _NewLocationFormState();
}

class _NewLocationFormState extends State<NewLocationForm> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new AppBar(
        title: new Text('Add Location'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.location_searching),
            onPressed: () {},
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
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: new Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                const SizedBox(height: 24.0),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_on),
                    labelText: 'Name *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'City *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'State *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Country *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Pin/Zip Code *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Latitude *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Longitude *',
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}