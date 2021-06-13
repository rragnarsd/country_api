import 'package:http/http.dart' as http;
import '../models/countries.dart';

class Services {
  static const String url =
      'https://restcountries.eu/rest/v2/all?fields=name;capital;region;population;currencies;flag#';
  static /*Future<List<Country>> */getCountries() async {
    try {
      final response = await http.get(Uri.parse(url));
      if (200 == response.statusCode) {
        final List<Country> countries = countriesFromJson(response.body);
        return countries;
      } else {
        return <Country>[];
      }
    } catch (error) {
      return <Country>[];
    }
  }
}
