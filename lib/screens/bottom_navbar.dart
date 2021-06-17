import 'package:country_api/screens/favorite_screen.dart';
import 'package:country_api/screens/home_screen.dart';
import 'package:flutter/material.dart';

import 'all_countries.dart';
import 'country.dart';

class BottomNavBar extends StatefulWidget {
  final List<Country> visitedCountries;

  BottomNavBar({this.visitedCountries});

  @override
  _BottomNavBarState createState() => _BottomNavBarState();
}

class _BottomNavBarState extends State<BottomNavBar> {
  List<Map<String, Object>> _pages;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pages = [
      {
        'page': HomeScreen(),
        'title': 'Home Screen',
      },
      {
        'page': AllCountries(),
        'title': 'Feeds Screen',
      },
      {
        /*'page': FavoriteScreen(widget.visitedCountries),*/
        'page': FavoriteScreen(),
        'title': 'Profile Screen',
      },

    ];
    super.initState();
  }

  void _onTap(int index){
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.blue,
        currentIndex: _selectedIndex,
        onTap: _onTap,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
            tooltip: 'Home',
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.public),
              label: 'Countries'
          ),
          BottomNavigationBarItem(
              icon: Icon(Icons.list),
              label: 'My List'
          )
        ],
      ),
    );
  }
}
