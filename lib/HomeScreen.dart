import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'ListScreen.dart';
import 'TourListScreen.dart';
import 'MapScreen.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _children = [
    new ListScreen(),
    new TourListScreen(),
    new MapScreen()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _children[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        onTap: onTabTapped,
        currentIndex: _currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: Icon(FontAwesomeIcons.listAlt),
            title: Text('Lists')
          ),
          BottomNavigationBarItem (
            icon: Icon(FontAwesomeIcons.mapMarkerAlt),
            title: Text("Tours")
          ),
          BottomNavigationBarItem (
            icon: Icon(FontAwesomeIcons.map),
            title: Text("Map")
          ),
        ],
      ),
    );
  }

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    }); 
  }
}