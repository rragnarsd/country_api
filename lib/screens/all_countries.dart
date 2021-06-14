import 'package:country_api/screens/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AllCountries extends StatefulWidget {

  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  Future<List> countries;
  List<String> countriesFlag = [];
  String flag;

  Future<List> fetchCountries() async {
    /*var response = await Dio().get('https://restcountries.eu/rest/v2/all');*/
    var response = await Dio().get('https://restcountries.eu/rest/v2/all?fields=name;capital;currencies;alpha3Code;flag;languages;population;subregion;');

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
        body: FutureBuilder<List>(
          future: countries,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 10.0,
                      crossAxisSpacing: 10.0,
                    ),
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
                          child:
                          Text(snapshot.data[index]['name'], style: TextStyle(fontSize: 16.0),),
                              /*SvgPicture.network(snapshot.data[index]['flag']),*/
                        ),
                      );
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
    );
  }
}
