// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class SearchPage extends StatefulWidget {
  
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController _cityName = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              kSpace,
              Text(
                'Pick Location',
                style: homePageHeader,
              ),
              kSpace,
              Padding(
                padding: const EdgeInsets.all(9.0),
                child: Text(
                  'Search weather data from over 20,000 cities',
                  style: TextStyle(
                      fontSize: 17.5,
                      fontWeight: FontWeight.w300,
                      color: Colors.white),
                ),
              ),
              kSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      color: Color.fromRGBO(255, 255, 255, 0.15),
                      width: 270,
                      height: 60,
                      child: TextField(
                        controller: _cityName,
                        style: TextStyle(color: Colors.white),
                        decoration: InputDecoration(
                            focusedBorder: OutlineInputBorder(
                                borderSide:
                                    BorderSide(color: Colors.transparent)),
                            prefixIcon: Icon(
                              Icons.search,
                              color: Colors.white,
                            ),
                            hintText: 'Search',
                            hintStyle: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w300,
                                color: Colors.white)),
                      ),
                    ),
                  ),
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Container(
                      height: 60,
                      width: 60,
                      color: Color.fromRGBO(255, 255, 255, 0.15),
                      child: IconButton(
                        onPressed: (){},
                        icon: Icon(Icons.location_pin, color: Colors.white,),
                      ),
                    ),
                  )
                ],
              ),
              Container(
                height: 100,
                width: 120,
                color: Colors.blue,
                child: Row(
                  children: [
                    Column(
                      children: [
                        Text('')
                      ],
                    )
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
