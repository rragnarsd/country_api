import 'package:country_api/services/services.dart';
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
        primarySwatch: Colors.blue,
      ),
      home: Country(),
    );
  }
}

class Country extends StatefulWidget {
  @override
  _CountryState createState() => _CountryState();
}

class _CountryState extends State<Country> {
  List<Country> _countries;
  bool _isLoading;

  @override
  void initState() {
    super.initState();
    _isLoading = true;
    Services.getCountries().then((countries) {
      _countries = countries;
      _isLoading = false;
    });
  }
/*  List listResponse;
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
  }*/

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_isLoading ? 'Loading...' : 'Countries'),
      ),
      body: Container(
          color: Colors.white,
          child: ListView.builder(
              itemCount: null == _countries ? 0 : _countries.length,
              itemBuilder: (context, index) {
                Country country = _countries[index];
                return ListTile(
                  title: Text(_countries[index]),
                );
              }),
      ),
      /* body: SingleChildScrollView(
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
             */ /* itemCount: imageUrl.length,*/ /*
              itemBuilder: (BuildContext context, int index) {
                return GestureDetector(
                  onTap: () {
                    print('print');
                  },
                  child: Card(
                    child:
                        */ /*Image.network(mapResponse[index])*/ /*
                        Center(
                            child: Text(
                              'hæ',
                      */ /*listResponse[index]['name'],*/ /*
                      style: TextStyle(fontSize: 16.0),
                    )),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    )*/
    );
  }
}
