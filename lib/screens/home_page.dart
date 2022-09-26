// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:weather/services/networking.dart';
import 'package:weather/utilities/constants.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

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
  var _weatherData;
  @override
  void initState() {
    // TODO: implement initState
    getWeatherData;
  }

  Future getWeatherData() async {
    _weatherData = await ApiService().getLocationWeather();
    print(_weatherData);
  }
  // getLocation() async {
  //   LocationPermission permission;
  //   permission = await Geolocator.checkPermission();
  //   if (permission == LocationPermission.denied) {
  //     permission = await Geolocator.requestPermission();
  //     if (permission == LocationPermission.deniedForever) {
  //       return Future.error('Location Not Available');
  //     }
  //   } else {
  //     //return await Geolocator.getCurrentPosition();
  //     Position position = await Geolocator.getCurrentPosition(
  //         desiredAccuracy: LocationAccuracy.high);

  //     print(position);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    //getLocation();
    getWeatherData();
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: getWeatherData(),
            builder: (context, snapshot) {
              
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done && snapshot.hasData){
                return Text('Successful');
              } else {
                return Text('Loading', style: TextStyle(color: Colors.white),);
              }
            },
          ),
        ),
        // body: Center(
        //   child: Column(
        //     children: [
        //       SizedBox(
        //         height: 20,
        //       ),
        //       Text(
        //         'Abuja',
        //         style: homePageHeader,
        //       ),
        //       kImprovedSpace,
        //       Text(
        //         'May 28, 2021',
        //         style: kDateStyle,
        //       ),
        //       kImprovedSpace,
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.center,
        //         children: [
        //           ClipContainer(
        //             colorContainer: _colorContainer,
        //             text: 'Forecast',
        //           ),
        //           SizedBox(
        //             width: 3,
        //           ),
        //           ClipContainer(
        //             colorContainer: _colorContainer,
        //             text: 'Air Quality',
        //           ),
        //         ],
        //       ),
        //       kImprovedSpace,
        //       Container(
        //         height: 195,
        //         width: double.infinity,
        //         child: Image.asset('images/cloud-with-snow.png'),
        //       ),
        //       kSpace,
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.start,
        //         children: [
        //           SizedBox(
        //             width: 35,
        //           ),
        //           Container(
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.symmetric(vertical: 4.0),
        //                   child: Text(
        //                     'Temp',
        //                     style: kDateStyle,
        //                   ),
        //                 ),
        //                 Text(
        //                   '32°C',
        //                   style: kTempStyle,
        //                 )
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             width: 50,
        //           ),
        //           Container(
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.all(4.0),
        //                   child: Text(
        //                     'Wind',
        //                     style: kDateStyle,
        //                   ),
        //                 ),
        //                 Text(
        //                   '10km/h',
        //                   style: kTempStyle,
        //                 )
        //               ],
        //             ),
        //           ),
        //           SizedBox(
        //             width: 45,
        //           ),
        //           Container(
        //             child: Column(
        //               children: [
        //                 Padding(
        //                   padding: const EdgeInsets.all(4.0),
        //                   child: Text(
        //                     'Humidity',
        //                     style: kDateStyle,
        //                   ),
        //                 ),
        //                 Text(
        //                   '75%',
        //                   style: kTempStyle,
        //                 )
        //               ],
        //             ),
        //           ),
        //         ],
        //       ),
        //       Row(
        //         mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //         children: [
        //           Padding(
        //             padding: const EdgeInsets.all(12.0),
        //             child: Text(
        //               'Today',
        //               style: kDateStyle,
        //             ),
        //           ),
        //           Padding(
        //             padding: const EdgeInsets.all(12.0),
        //             child: TextButton(
        //                 onPressed: () {}, child: Text('View full report')),
        //           )
        //         ],
        //       ),
        //       SizedBox(
        //         height: 90,
        //         child: ListView(
        //           shrinkWrap: true,
        //           scrollDirection: Axis.horizontal,
        //           children: [
        //             TestContainer(),
        //             TestContainer(),
        //             TestContainer(),
        //             TestContainer(),
        //             TestContainer(),
        //           ],
        //         ),
        //       )
        //     ],
        //   ),
        //  ),
      ),
    );
  }
}
