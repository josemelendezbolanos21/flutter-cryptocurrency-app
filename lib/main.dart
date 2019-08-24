import 'package:flutter/material.dart';
import './home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

void main() async {
  List currencies = await getCurrencies();
  runApp(MyApp(currencies));
}


class MyApp extends StatelessWidget {

  final List _currencies;
  MyApp(this._currencies);

  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
      primaryColor: Colors.pinkAccent,
    ),
    home: HomePage(_currencies),
    debugShowCheckedModeBanner: false,
  );
}

Future<List> getCurrencies() async {
  String cryptoApiUrl = "https://api.coinmarketcap.com/v1/ticker/?limit=10";
  http.Response response = await http.get(cryptoApiUrl);
  return json.decode(response.body);
}
