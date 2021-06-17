import 'package:country_api/screens/bottom_navbar.dart';
import 'package:country_api/screens/favorite_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Countries API',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 2,
          ),
      ),
      home: BottomNavBar(),
      routes: {
        /*  '/FavoriteList': (context) => FavoriteScreen(visitedCountries),*/
          '/FavoriteList': (context) => FavoriteScreen(),
        });
  }
}
