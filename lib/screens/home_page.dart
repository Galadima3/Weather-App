// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables
import 'package:geolocator/geolocator.dart';
import 'package:flutter/material.dart';
import 'package:weather/utilities/constants.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final  _colorContainer = Color.fromARGB(255, 5, 71, 124);
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
      print(position);
      setState(() {
        lat = position.latitude.toString();
        long = position.longitude.toString();
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xFF090A3C),
        body: Center(
          child: Column(
            children: [
              kSpace,
              Text(
                'Abuja',
                style: homePageHeader,
              ),
              kSpace,
              Text(
                'May 28, 2021',
                style: kDateStyle,
              ),
              kSpace,
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipContainer(colorContainer: _colorContainer, text: 'Forecast',),
                  SizedBox(width: 3,),
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
              kSpace,
              Container(
                
                height: 200,
                  width: double.infinity,
                child: Image.asset('images/cloud-with-snow.png'),
              ),
              Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('Temp'),
                        Text('Temp'),
                        Text('Temp')
                      ],
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ClipContainer extends StatelessWidget {
  const ClipContainer({
    Key? key,
    required Color colorContainer, required this.text,
  }) : _colorContainer = colorContainer, super(key: key);

  final Color _colorContainer;
  final String text;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15),
      child: Container(
        height: 38,
        width: 120,
        color: _colorContainer,
        child: Center(
          child: Text(text, style: TextStyle(color: Colors.white, fontSize: 15),),
        ),
      ),
    );
  }
}
