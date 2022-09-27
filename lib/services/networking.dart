import 'dart:convert';
import 'dart:developer';

import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart';

class ApiService {
  getLocationWeather() async {
    try {
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

        var uri =
            'https://api.openweathermap.org/data/2.5/weather?lat=${position.latitude}&lon=${position.longitude}&appid=18966628b08a83615fea91c56f19fb3c&units=metric';
        var url = Uri.parse(uri);
        var response = await get(url);
        if (response.statusCode == 200) {
          var model = jsonDecode(response.body);

          return model;
        }
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }

  getCityWeather(String cityName) async {
    try {
      var uri =
          'https://api.openweathermap.org/data/2.5/weather?q=$cityName&appid=18966628b08a83615fea91c56f19fb3c&units=metric';
      var url = Uri.parse(uri);
      var response = await get(url);
      if (response.statusCode == 200) {
        var model = jsonDecode(response.body);
        return model;
      }
    } on Exception catch (e) {
      log(e.toString());
    }
  }
}
