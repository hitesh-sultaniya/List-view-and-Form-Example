import 'package:flutter/material.dart';

class TourNavigator {
  static void goToHome(BuildContext context) {
    Navigator.pushReplacementNamed(context, "/TourListScreen");
  }

  static void goToAddTourScreen(BuildContext context) {
    Navigator.pushNamed(context, "/ListScreen");
  }

  static void goToLocationForm(BuildContext context) {
    Navigator.pushNamed(context, "/NewLocationForm");
  }
}