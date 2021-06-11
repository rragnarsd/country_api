import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

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
        primarySwatch: Colors.blue,
      ),
      home: Countries(),
    );
  }
}

class Countries extends StatefulWidget {
  @override
  _CountriesState createState() => _CountriesState();
}

class _CountriesState extends State<Countries> {
  List listResponse;
  Map mapResponse;
  List listOfNames;
  List imageUrl = [];

  Future fetchDataFromApi() async {
    var jsonData = await http.get(
      Uri.parse(
          'https://restcountries.eu/rest/v2/all?fields=name;capital;region;population;currencies;flag'),
    );
    var fetchData = jsonDecode(jsonData.body);

    setState(() {
      listResponse = fetchData;
      listResponse.forEach((element) {
        imageUrl.add(element['flag']);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    fetchDataFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 20.0, left: 20.0),
        child: Column(
          children: [
            GridView.builder(
              physics: NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 10.0,
                crossAxisSpacing: 10.0,
              ),
              itemCount: imageUrl.length,
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print('print');
                  },
                  child: Card(
                    child:
                        /*Image.network(mapResponse[index])*/
                        Center(
                            child: Text(
                      listResponse[index]['name'],
                      style: TextStyle(fontSize: 16.0),
                    )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    ));
  }
}
