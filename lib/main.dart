import 'package:country_api/screens/all_countries.dart';
import 'package:country_api/screens/bottom_navbar.dart';
import 'package:country_api/screens/home_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
          primarySwatch: Colors.lightBlue,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 2),
      ),
      home: BottomNavBar(),
    );
  }
}
