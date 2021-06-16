import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Country extends StatefulWidget {
  final Map country;

  Country(this.country);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  String flag;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.country['name']),
      ),
      body: Column(
        children: [
          SizedBox(height: 20.0,),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: 350
              ),
                child: SvgPicture.network(widget.country['flag'], height: 240),
            ),
          ),
          SizedBox(height: 20.0,),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(widget.country['name'], style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 20.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Country Name: ',
                textInfoTwo: 'name',
              ),
              SizedBox(height: 10.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Capital: ',
                textInfoTwo: 'capital',
              ),
              SizedBox(height: 10.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Region: ',
                textInfoTwo: 'region',
              ),
              SizedBox(height: 10.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Sub-Region: ',
                textInfoTwo: 'subregion',
              ),
              SizedBox(height: 10.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Population: ',
                textInfoTwo: 'population',
              ),
              SizedBox(height: 10.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Alpha-3-Code: ',
                textInfoTwo: 'alpha3Code',
              ),
              SizedBox(height: 10.0,),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Language: ',
                /*textInfoTwo: '\${languages[2]}'*/
               /* textInfoTwo: 'languages[2]'*/
                textInfoTwo: '\${languages}[2]'
              ),
            ],
          )
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
    this.language,
  }) : super(key: key);

  final Map country;
  final String textInfoOne;
  final String textInfoTwo;
  final String language;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Row(
          children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(fontSize: 18.0, color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text: textInfoOne,
                  style: TextStyle(fontWeight: FontWeight.w600,),
                ),
                TextSpan(
                  text: country[textInfoTwo].toString(),
                ),
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
