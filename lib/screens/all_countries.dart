import 'package:country_api/screens/country.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class AllCountries extends StatefulWidget {
  @override
  _AllCountriesState createState() => _AllCountriesState();
}

class _AllCountriesState extends State<AllCountries> {
  bool _pinned = true;
  List countries = [];
  //Need another list which will hold the filtered data
  List filteredCountries = [];
  String searchText = '';
  final _searchController = TextEditingController();

  fetchCountries() async {
    var response = await Dio().get('https://restcountries.eu/rest/v2/all');
    return response.data;
  }

  @override
  void initState() {
    fetchCountries().then((data) {
      setState(() {
        countries = filteredCountries = data;
      });
    });
    super.initState();
  }

  void filterCountries(value) {
    setState(() {
      filteredCountries =
          countries.where((country) => country['name'].toLowerCase().contains(value.toLowerCase())).toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: CustomScrollView(slivers: [
      SliverAppBar(
        pinned: _pinned,
        expandedHeight: 200.0,
        flexibleSpace: FlexibleSpaceBar(
          title: Text(
            'Countries',
            style: TextStyle(color: Colors.white),
          ),
          background: Image.network(
            'https://images.unsplash.com/photo-1600633349333-eebb43d01e23?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&auto=format&fit=crop&w=1950&q=80',
            fit: BoxFit.cover,
          ),
        ),
      ),
      SliverToBoxAdapter(
          child: Padding(
        padding: const EdgeInsets.only(top: 20.0, left: 20.0, right: 20.0),
        child: TextField(
          controller: _searchController,
          decoration: InputDecoration(
              prefixIcon: Icon(Icons.search),
              hintText: 'Search',
              isDense: true,
              suffixIcon: IconButton(
                  icon: Icon(
                    Icons.close,
                    color: _searchController.text.isNotEmpty
                        ? Colors.red
                        : Colors.grey,
                  ),
                  onPressed: _searchController.text.isEmpty
                      ? null
                      : () {
                          _searchController.clear();
                          setState(() {
                            filteredCountries = countries;
                          });
                        }),
          ),
          onChanged: (value) {
            filterCountries(value);
          },
        ),
      ),
      ),
      SliverToBoxAdapter(
          child: filteredCountries.length > 0
              ? Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: ListView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: filteredCountries.length,
                    itemBuilder: (context, int index) {
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) =>
                                  Country(filteredCountries[index]),
                            ),
                          );
                        },
                        child: Card(
                          elevation: 2,
                          child: ListTile(
                            title: Text(
                              filteredCountries[index]['name'],
                            ),
                            trailing: Icon(Icons.keyboard_arrow_right),
                          ),
                        ),
                      );
                    },
                  ),
                )
              : Center(
                  child: Padding(
                  padding: const EdgeInsets.only(top: 50.0),
                  child: CircularProgressIndicator(),
                ),
          )
          )
    ]),
    );
  }
}
