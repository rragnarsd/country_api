import 'package:country_api/screens/all_countries.dart';
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
        fontFamily: 'Nunito',
          primarySwatch: Colors.lightBlue,
          appBarTheme: AppBarTheme(
              iconTheme: IconThemeData(color: Colors.white),
              elevation: 2,
          ),
      ),
      home: AllCountries(),
    );
  }
}
