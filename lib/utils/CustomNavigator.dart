import 'package:flutter/material.dart';

class TourNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/HomeScreen");
  }

  static void goToLocationForm(BuildContext context) {
    Navigator.pushNamed(context, "/NewLocationForm");
  }
}