// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

import 'package:intl/intl.dart';
  import 'package:weather/services/networking.dart';
import 'package:weather/utilities/constants.dart';


import '../utilities/widgets.dart';

class HomePage extends StatefulWidget {
  final weatherData;
  const HomePage({super.key, this.weatherData});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _colorContainer = Color.fromARGB(255, 5, 71, 124);
  var temp = '0.0';
  var humidity = '';
  var windSpeed = '';
  var _weatherData;
  var userLocation = '';
  // @override
  // void initState() {

  //   getWeatherData;
  // }

  

  Future getWeatherData() async {
    _weatherData = await ApiService().getLocationWeather();
    var tempData = _weatherData["main"]["temp"];
    var humidityData = _weatherData["main"]["humidity"];
    var locationData = _weatherData["name"];

    var windSpeedData = _weatherData["wind"]["speed"];
    setState(() {
      temp = tempData.toStringAsFixed(0);
      humidity = humidityData.toStringAsFixed(0);
      windSpeed = windSpeedData.toStringAsFixed(1);
      userLocation = locationData;
    });
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: FutureBuilder(
            future: getWeatherData(),
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return CircularProgressIndicator();
              } else if (snapshot.connectionState == ConnectionState.done ||
                  snapshot.hasData) {
                return Center(
                  child: Column(
                    children: [
                      SizedBox(
                        height: 20,
                      ),
                      Text(
                        userLocation,
                        style: homePageHeader,
                      ),
                      kImprovedSpace,
                      Text(
                        DateFormat("yMMMMd").format(DateTime.now()),
                        style: kDateStyle,
                      ),
                      kImprovedSpace,
                      kImprovedSpace,
                      SizedBox(
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
                          Column(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 4.0),
                                child: Text(
                                  'Temp',
                                  style: kDateStyle,
                                ),
                              ),
                              Text(
                                '$temp°C',
                                style: kTempStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 50,
                          ),
                          Column(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(4.0),
                                child: Text(
                                  'Wind',
                                  style: kDateStyle,
                                ),
                              ),
                              Text(
                                '$windSpeed km/h',
                                style: kTempStyle,
                              )
                            ],
                          ),
                          SizedBox(
                            width: 45,
                          ),
                          Flexible(
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
                                  '$humidity%',
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
                                onPressed: () {},
                                child: Text('View full report')),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 90,
                        child: ListView(
                          shrinkWrap: true,
                          scrollDirection: Axis.horizontal,
                          children: [
                            TestContainer(),
                            TestContainer(),
                            TestContainer(),
                            TestContainer(),
                            TestContainer(),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              } else {
                return Text('${snapshot.connectionState}');
              }
            },
          ),
        ),
      ),
    );
  }
}
