import 'package:flutter/material.dart';
import 'NewLocationForm.dart';
import 'models/LocationModel.dart';

class ListScreen extends StatefulWidget {
  @override
  _ListScreenState createState() => _ListScreenState();
}

class _ListScreenState extends State<ListScreen> {

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  List<LocationModel> arrLocationList = new List();
  
  void _pushNewLocationFormScreen(BuildContext context) async {

    final LocationModel newLocation = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => NewLocationForm()),
    );
    if (newLocation != null) {
      arrLocationList.add(newLocation);
      String locationName = newLocation.locationName;
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("Succesfully Added Tour Location $locationName"))); 
    }
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Add New Tour'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.add),
            onPressed: () {
              _pushNewLocationFormScreen(this.context);
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
        child: new ListView.builder(
          itemCount: arrLocationList.length,
          itemBuilder: (context,index) {
            return Card(
              elevation: 5.0,
              child: new ListTile(
                contentPadding: EdgeInsets.symmetric(horizontal: 10.0),
                title: new Text(arrLocationList[index].locationName,textScaleFactor:1.05,style: TextStyle(color: Colors.purple,fontWeight: FontWeight.bold)),
                subtitle: new Text(arrLocationList[index].cityName+','+arrLocationList[index].stateName+','+arrLocationList[index].countryName, textAlign: TextAlign.right,style: TextStyle(fontStyle: FontStyle.italic),),
              ),
            );
          },
        )
       ),
    );
  }
}