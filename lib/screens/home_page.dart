// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

import '../utilities/widgets.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _colorContainer = Color.fromARGB(255, 5, 71, 124);
  var lat = '0.0';
  var long = '0.0';
  getLocation() async {
    LocationPermission permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.deniedForever) {
        return Future.error('Location Not Available');
      }
    } else {
      //return await Geolocator.getCurrentPosition();
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      
      setState(() {
        lat = position.latitude.toString();
        long = position.longitude.toString();
      });
    }
  }

  int _selectedIndex = 0;
  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF090A3C),
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.white,
          selectedIconTheme: IconThemeData(color: Colors.blueAccent, size: 32),
          type: BottomNavigationBarType.fixed,
          backgroundColor: Color(0xFF090A3C),
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.home),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.search),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.trending_up_outlined),
              label: ''
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.settings),
              label: ''
            ),
          ],
          currentIndex: _selectedIndex,
          //selectedItemColor: Colors.amber[800],
          onTap: _onItemTapped,
        ),
    
        body: Center(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Abuja',
                style: homePageHeader,
              ),
              kImprovedSpace,
              Text(
                'May 28, 2021',
                style: kDateStyle,
              ),
              kImprovedSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipContainer(
                    colorContainer: _colorContainer,
                    text: 'Forecast',
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Container(
                      height: 37,
                      width: 120,
                      color: _colorContainer,
                    ),
                  ),
                ],
              ),
              kImprovedSpace,
              Container(
                height: 195,
                width: double.infinity,
                child: Image.asset('images/cloud-with-snow.png'),
              ),
              kSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 35,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 4.0),
                          child: Text(
                            'Temp',
                            style: kDateStyle,
                          ),
                        ),
                        Text(
                          '32°C',
                          style: kTempStyle,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 50,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Wind',
                            style: kDateStyle,
                          ),
                        ),
                        Text(
                          '10km/h',
                          style: kTempStyle,
                        )
                      ],
                    ),
                  ),
                  SizedBox(
                    width: 45,
                  ),
                  Container(
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            'Humidity',
                            style: kDateStyle,
                          ),
                        ),
                        Text(
                          '75%',
                          style: kTempStyle,
                        )
                      ],
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      'Today',
                      style: kDateStyle,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: TextButton(
                        onPressed: () {}, child: Text('View full report')),
                  )
                ],
              ),
              SizedBox(
                height: 90,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: [
                    TestContainer(color: Colors.red),
                    TestContainer(color: Colors.blue),
                    TestContainer(color: Colors.green),
                    TestContainer(color: Colors.yellow),
                    TestContainer(color: Colors.deepPurple),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
