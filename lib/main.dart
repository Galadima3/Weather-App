import 'package:flutter/material.dart';
import 'package:weather/screens/forecast_page.dart';
import 'package:weather/screens/home_page.dart';
import 'package:weather/screens/search_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFF090A3C),
        primarySwatch: Colors.blue,
      ),
      home: const SearchPage(),
    );
  }
}

