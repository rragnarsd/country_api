import 'package:country_api/screens/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  bool _pinned = true;
  Future<List> countries;
  List<String> countriesFlag = [];
  String flag;

  Future<List> fetchCountries() async {
    var response = await Dio().get(
        'https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    countries = fetchCountries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        pinned: _pinned,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text('Countries', style: TextStyle(color: Colors.white),),
          background: Image.network(
            'https://images.unsplash.com/photo-1600633349333-eebb43d01e23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverToBoxAdapter(
        child: FutureBuilder<List>(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: snapshot.data.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (context) =>
                                    Country(snapshot.data[index]),
                              ),
                            );
                          },
                          child: Card(
                            elevation: 2,
                            child: ListTile(
                              title: Text(
                                snapshot.data[index]['name'],
                              ),
                              trailing: Icon(Icons.keyboard_arrow_right),
                            ),
                          ));
                    },
                  ),
                ),
              );
            } else if (snapshot.hasError) {
              return Text('${snapshot.error}');
            }
            return Center(child: CircularProgressIndicator());
          },
        ),
      )
    ]));
  }
}
