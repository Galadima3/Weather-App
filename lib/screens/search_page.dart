// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';
import 'package:weather/services/networking.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

TextEditingController _cityName = TextEditingController();

class _SearchPageState extends State<SearchPage> {
  ApiService cityData = ApiService();

  var _cityData;
  getCityWeather(String cityName) async{
    _cityData = await ApiService().getCityWeather(_cityName.text.trim());
    print(_cityData);

  }
  // pushToNewScreen(){

  // }
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
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
                          onSubmitted: (value) {
                            getCityWeather(value);
                            
                          },
                          controller: _cityName,
                          style: TextStyle(color: Colors.white),
                          decoration: InputDecoration(
                              enabledBorder: OutlineInputBorder(
                                  borderSide:
                                      BorderSide(color: Colors.transparent)),
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
                          icon: Icon(
                            Icons.location_pin,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.fromLTRB(30, 8, 12, 0),
                      child: Column(
                        children: [
                          SearchInfoTile(),
                          kSpace,
                          SearchInfoTile(),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(15, 10, 0, 0),
                      child: Column(
                        children: [
                          SizedBox(
                            height: 55,
                          ),
                          SearchInfoTile(),
                          kSpace,
                          SearchInfoTile(),
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class SearchInfoTile extends StatefulWidget {
  const SearchInfoTile({
    Key? key,
  }) : super(key: key);

  @override
  State<SearchInfoTile> createState() => _SearchInfoTileState();
}

class _SearchInfoTileState extends State<SearchInfoTile> {
  Color activeColor = Colors.blue;
  Color inactiveColor = Color.fromRGBO(255, 255, 255, 0.15);

  bool pressed = false;
  bool pressedAgain = true;
  Color tileColor = Color.fromRGBO(255, 255, 255, 0.15);
  @override
  Widget build(BuildContext context) {
    return Material(
      borderRadius: BorderRadius.circular(12),
      color: inactiveColor,
      child: InkWell(
        onTap: () {
          
        },
        highlightColor: Colors.blue.withOpacity(0.9),
        splashColor: Colors.green.withOpacity(0.5),
        child: Container(
          decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(13.5),
          //color: Colors.blue,
        ),
        height: 130,
        width: 140,
        ),
      ),
    );
  }
}
