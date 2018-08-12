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
  TextEditingController controllerCityName = new TextEditingController();
  TextEditingController controllerStateName = new TextEditingController();
  TextEditingController controllerCountryName = new TextEditingController();
  TextEditingController controllerLatitude = new TextEditingController();
  TextEditingController controllerLongitude = new TextEditingController();
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

  void _saveTourLocation() {

   final form = formKey.currentState;
    
    if (form.validate()) {

      form.save();
      Navigator.pop(context,currentLocation);
    }

  }

   Future getLaLongFromAddress() async {

    this.setState(() {
      this.isLoading = true;
    });
    
    if (controllerCityName.text.length > 0 && controllerStateName.text.length > 0 && controllerCountryName.text.length > 0) {

      String strAddress = controllerCityName.text + ", " + controllerStateName.text + ", " + controllerCountryName.text;
      try{
           var results = await Geocoder.local.findAddressesFromQuery(strAddress);
           this.setState(() {
            fetchedAddress = results.first;
            controllerLatitude.text = fetchedAddress.coordinates.latitude.toString();
            controllerLongitude.text = fetchedAddress.coordinates.longitude.toString();
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
        title: new Text('Add Location'),
        actions: <Widget>[
          IconButton(
            icon: new Icon(Icons.location_searching),
            onPressed: getLaLongFromAddress,
          ),
          FlatButton(
            child: new Text(
              'Save',
              textScaleFactor: 1.25,
            ),
            textColor: Colors.white,
            onPressed: _saveTourLocation,
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
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Latitude *',
                  ),
                  controller: controllerLatitude,
                  validator: (latitude) => latitude.length == 0 ? 'Tap on location button to get latitude' : null,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (latitude) => currentLocation.latitude = double.parse(latitude),
                ),
                new TextFormField(
                  decoration: const InputDecoration(
                    border: UnderlineInputBorder(),
                    filled: false,
                    icon: Icon(Icons.location_city),
                    labelText: 'Longitude *',
                  ),
                  controller: controllerLongitude,
                  validator: (longitude) => longitude.length == 0 ? 'Tap on locatin button to get longitude' : null,
                  keyboardType: TextInputType.numberWithOptions(decimal: true),
                  onSaved: (longitude) => currentLocation.longitude = double.parse(longitude),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}