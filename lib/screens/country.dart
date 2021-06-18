import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';


class Country extends StatefulWidget {
  final Map country;

  Country(this.country);

  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  bool beenThere = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade50,
      appBar: AppBar(
          iconTheme: IconThemeData(color: Colors.white),
          title: Text(
            widget.country['name'],
            style: TextStyle(color: Colors.white),
          ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 20.0,
          ),
          Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: 350),
              child: SvgPicture.network(widget.country['flag'], height: 240),
            ),
          ),
          SizedBox(
            height: 20.0,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 30.0, right: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        widget.country['name'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          color: Colors.black87
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20.0,
              ),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Country Name: ',
                textInfoTwo: 'name',
              ),
              SizedBox(
                height: 10.0,
              ),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Capital: ',
                textInfoTwo: 'capital',
              ),
              SizedBox(
                height: 10.0,
              ),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Region: ',
                textInfoTwo: 'region',
              ),
              SizedBox(
                height: 10.0,
              ),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Sub-Region: ',
                textInfoTwo: 'subregion',
              ),
              SizedBox(
                height: 10.0,
              ),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Population: ',
                textInfoTwo: 'population',
              ),
              SizedBox(
                height: 10.0,
              ),
              CountryInfo(
                country: widget.country,
                textInfoOne: 'Alpha-3-Code: ',
                textInfoTwo: 'alpha3Code',
              ),
              SizedBox(
                height: 10.0,
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
  }) : super(key: key);

  final Map country;
  final String textInfoOne;
  final String textInfoTwo;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 350,
      child: Row(children: [
        Flexible(
          child: RichText(
            overflow: TextOverflow.ellipsis,
            text: TextSpan(
              style: TextStyle(
                fontSize: 18.0,
                color: Colors.black87,
              ),
              children: [
                TextSpan(
                  text: textInfoOne,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                      color: Colors.black87
                  ),
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
