import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import './home_page.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import 'dependency_injection.dart';

void main() async {
  Injector.configure(Flavor.PROD);
  runApp(MyApp());
}


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
    theme: ThemeData(
      primarySwatch: Colors.pink,
      primaryColor: defaultTargetPlatform == TargetPlatform.iOS ? Colors.grey[100] : null,
    ),
    home: HomePage(),
    debugShowCheckedModeBanner: false,
  );
}
