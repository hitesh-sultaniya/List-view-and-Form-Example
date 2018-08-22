import 'package:flutter/material.dart';
import 'models/LocationModel.dart';
import 'package:geocoder/geocoder.dart';
import 'dart:async';

class NewLocationForm extends StatefulWidget {
  @override
  _NewLocationFormState createState() => _NewLocationFormState();
}

class _NewLocationFormState extends State<NewLocationForm> {

  final scaffoldKey = new GlobalKey<ScaffoldState>();
  final formKey = new GlobalKey<FormState>();
  TextEditingController controllerStreetName = new TextEditingController();
  TextEditingController controllerCityName = new TextEditingController();
  TextEditingController controllerStateName = new TextEditingController();
  TextEditingController controllerCountryName = new TextEditingController();
  Address fetchedAddress = new Address();
  bool isLoading = false;
  LocationModel currentLocation = new LocationModel();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
  }

   Future getLaLongFromAddressAndSave() async {

    this.setState(() {
      this.isLoading = true;
    });
    
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      String strAddress = controllerStreetName.text + ", "+controllerCityName.text + ", " + controllerStateName.text + ", " + controllerCountryName.text;
      try{
           var results = await Geocoder.local.findAddressesFromQuery(strAddress);
           this.setState(() {
            fetchedAddress = results.first;
            currentLocation.latitude = fetchedAddress.coordinates.latitude;
            currentLocation.longitude = fetchedAddress.coordinates.longitude;
            Navigator.pop(context,currentLocation);
           });
      }
      catch(e) {
        print("Error occured: $e");
      }
      finally {
        this.setState(() {
          this.isLoading = false;
        });
      }  

    }
    else
    {
      scaffoldKey.currentState.showSnackBar(SnackBar(content: Text("City, State And Country are Mendatory to get latitude and longitude !")));
    }

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      appBar: new AppBar(
        title: new Text('Location'),
        actions: <Widget>[
          FlatButton(
            child: new Text(
              'Add',
              textScaleFactor: 1.25,
            ),
            textColor: Colors.white,
            onPressed: getLaLongFromAddressAndSave,
          )
        ],
      ),
      body: new SafeArea(
        top: false,
        bottom: false,
        child: new Form(
          key: formKey,
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
                  validator: (locationName) => locationName.length == 0 ? 'Location Name is Mendatory' : null,
                  onSaved: (locationName) => currentLocation.locationName = locationName,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Street *',
                  ),
                  controller: controllerStreetName,
                  validator: (street) => street.length == 0 ? 'Street is Mendatory' : null,
                  onSaved: (streetName) => currentLocation.streetName = streetName,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'City *',
                  ),
                  controller: controllerCityName,
                  validator: (city) => city.length == 0 ? 'City is Mendatory' : null,
                  onSaved: (cityName) => currentLocation.cityName = cityName,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'State *',
                  ),
                  controller: controllerStateName,
                  validator: (state) => state.length == 0 ? 'State is Mendatory' : null,
                  onSaved: (stateName) => currentLocation.stateName = stateName,
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Country *',
                  ),
                  controller: controllerCountryName,
                  validator: (country) => country.length == 0 ? 'Country is Mendatory' : null,
                  onSaved: (countryName) => currentLocation.countryName = countryName,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}