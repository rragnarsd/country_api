// To parse this JSON data, do
//
//     final countries = countriesFromJson(jsonString);

import 'dart:convert';

List<Country> countriesFromJson(String str) => List<Country>.from(json.decode(str).map((x) => Country.fromJson(x)));

String countriesToJson(List<Country> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Country {
  Country({
    this.currencies,
    this.flag,
    this.name,
    this.capital,
    this.region,
    this.population,
  });

  List<Currency> currencies;
  String flag;
  String name;
  String capital;
  String region;
  int population;

  factory Country.fromJson(Map<String, dynamic> json) => Country(
    currencies: List<Currency>.from(json["currencies"].map((x) => Currency.fromJson(x))),
    flag: json["flag"],
    name: json["name"],
    capital: json["capital"],
    region: json["region"],
    population: json["population"],
  );

  Map<String, dynamic> toJson() => {
    "currencies": List<dynamic>.from(currencies.map((x) => x.toJson())),
    "flag": flag,
    "name": name,
    "capital": capital,
    "region": region,
    "population": population,
  };
}

class Currency {
  Currency({
    this.code,
    this.name,
    this.symbol,
  });

  String code;
  String name;
  String symbol;

  factory Currency.fromJson(Map<String, dynamic> json) => Currency(
    code: json["code"],
    name: json["name"],
    symbol: json["symbol"],
  );

  Map<String, dynamic> toJson() => {
    "code": code,
    "name": name,
    "symbol": symbol,
  };
}
