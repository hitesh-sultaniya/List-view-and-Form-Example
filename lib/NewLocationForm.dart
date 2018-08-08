import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

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
          FlatButton(
            child: new Text(
              'Save',
              textScaleFactor: 1.25,
            ),
            textColor: Colors.white,
            onPressed: (){
              Navigator.pop(context);
            },
          ),
          IconButton(
            icon: new Icon(FontAwesomeIcons.search),
            onPressed: (){},
          ),
        ],
      ),
      floatingActionButton: new FloatingActionButton(
        child: new Icon(Icons.my_location),
        onPressed: () {},
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
                    hintText: 'Add location name.',
                    labelText: 'Name *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    hintText: 'Add City Name.',
                    labelText: 'City *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    hintText: 'Add State Name',
                    labelText: 'State *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    hintText: 'Add Country Name.',
                    labelText: 'Country *',
                  ),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    hintText: 'Add Pin/Zip Code.',
                    labelText: 'Pin/Zip Code *',
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