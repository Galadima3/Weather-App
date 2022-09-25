// ignore_for_file: prefer_const_constructors

import 'package:bottom_navy_bar/bottom_navy_bar.dart';
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
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _currentIndex = 0;
  late PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() => _currentIndex = index);
          },
          children: const <Widget>[
            HomePage(),
            SearchPage(),
            ForecastScreen(),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        iconSize: 25,
        containerHeight: 63,
        backgroundColor: Colors.transparent,
        selectedIndex: _currentIndex,
        onItemSelected: (index) {
          setState(() => _currentIndex = index);
          _pageController.animateToPage(index, duration: Duration(milliseconds: 1200), curve: Curves.ease);
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              title: Text('Home'),
              icon: Icon(Icons.home),
              activeColor: Colors.blue,
              inactiveColor: Colors.white),
          BottomNavyBarItem(
              title: Text('Search'),
              icon: Icon(Icons.search),
              activeColor: Colors.blue,
              inactiveColor: Colors.white),
          BottomNavyBarItem(
              title: Text('Forecast'),
              icon: Icon(Icons.trending_up),
              activeColor: Colors.blue,
              inactiveColor: Colors.white),
          BottomNavyBarItem(
              title: Text(''),
              icon: Icon(Icons.settings),
              activeColor: Colors.blue,
              inactiveColor: Colors.white),
        ],
      ),
    );
  }
}
