import 'package:country_api/screens/country.dart';
import 'package:flutter/material.dart';

class FavoriteScreen extends StatefulWidget {
/*  final List<Country> visitedCountries;
  FavoriteScreen(this.visitedCountries);*/

  @override
  _FavoriteScreenState createState() => _FavoriteScreenState();
}

class _FavoriteScreenState extends State<FavoriteScreen> {
  bool beenThere = false;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 300,
          ),
          Text('I have Been here!'),
          Expanded(
            child: ListView.builder(
                itemCount: 2,
                itemBuilder: (context, index) {
                  return ListTile(title: Text('hæ'));
                  /*itemCount: _visitedCountries.length, itemBuilder: (context, index) {
                  return ListTile(title: Text(widget.country[index]['name']),);*/
                }),
          )
        ],
      ),
    );
  }
}
