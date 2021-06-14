import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatelessWidget {
  final Map country;
  Country(this.country);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(country['name']),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Center(
            child: Container(
                child: SvgPicture.network(country['flag'], height: 230,),
            ),
          ),
          SizedBox(height: 20.0,),
          CountryInfo(
            country: country,
            textInfoOne: 'Country Name: ',
            textInfoTwo: 'name',
          ),
          SizedBox(height: 5.0,),
          CountryInfo(
            country: country,
            textInfoOne: 'Capital: ',
            textInfoTwo: 'capital',
          ),
          SizedBox(height: 5.0,),
          CountryInfo(
            country: country,
            textInfoOne: 'Region: ',
            textInfoTwo: 'region',
          ),
          SizedBox(height: 5.0,),
          CountryInfo(
            country: country,
            textInfoOne: 'Sub-Region: ',
            textInfoTwo: 'region',
          ),
          SizedBox(height: 5.0,),
          CountryInfo(
            country: country,
            textInfoOne: 'Population: ',
            textInfoTwo: 'population',
          ),
          SizedBox(height: 5.0,),
          CountryInfo(
            country: country,
            textInfoOne: 'Alpha-3-Code: ',
            textInfoTwo: 'alpha3Code',
          ),
         /* CountryInfo(
            country: country,
            textInfoOne: 'Currency: ',
            textInfoTwo: '${currencies[3]}',
          ),*/
        ],
      ),
    );
  }
}

class CountryInfo extends StatelessWidget {
  const CountryInfo({
    Key key,
    @required this.country,
    this.textInfoOne,
    this.textInfoTwo,
  }) : super(key: key);

  final Map country;
  final String textInfoOne;
  final String textInfoTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Row(
          children: [
        RichText(
          text: TextSpan(
            style: TextStyle(fontSize: 18.0, color: Colors.black87,
            ),
            children: [
              TextSpan(
                text: textInfoOne,
                style: TextStyle(fontWeight: FontWeight.w600),
              ),
              TextSpan(
                text: country[textInfoTwo].toString(),
              ),
            ],
          ),
        ),
      ]),
    );
  }
}
