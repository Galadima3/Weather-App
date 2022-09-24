// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

import '../utilities/widgets.dart';

class ForecastScreen extends StatefulWidget {
  const ForecastScreen({super.key});

  @override
  State<ForecastScreen> createState() => _ForecastScreenState();
}

class _ForecastScreenState extends State<ForecastScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 20,
              ),
              Text(
                'Forecast Report',
                style: homePageHeader,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Today', style: kDateStyleX),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('May 28, 2021', style: kDateStyleX),
                  ),
                ],
              ),
              kSpace,
              Container(
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
              ),
              kSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Text('Next Forecast', style: kDateStyleX),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Icon(
                      Icons.calendar_month_outlined,
                      color: Colors.white,
                      size: 25,
                    ),
                  ),
                ],
              ),
              Column(
                children: [
                  ForecastTile(date: 'Sept 23', temp: '23', dayOfWeek: 'Friday'),
                  ForecastTile(date: 'Sept 24', temp: '22', dayOfWeek: 'Saturday'),
                  ForecastTile(date: 'Sept 25', temp: '21', dayOfWeek: 'Sunday'),
                  ForecastTile(date: 'Sept 26', temp: '26', dayOfWeek: 'Monday'),
                  ForecastTile(date: 'Sept 27', temp: '24', dayOfWeek: 'Tuesday'),
                  ForecastTile(date: 'Sept 28', temp: '20', dayOfWeek: 'Wednesday'),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
