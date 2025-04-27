import 'dart:convert';

// import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:http/http.dart' as http;
import 'package:test/models/weather_model.dart';
// import 'package:geocoding/geocoding.dart';

class WeatherService {
  String baseUrl = 'http://api.weatherapi.com/v1';
  String apiKey = '3677bed892474b30b7a122242220806';

  Future<WeatherModel> getCurrentWeather({required String cityName}) async {
    http.Response response = await http.get(
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=7'));

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);

      WeatherModel weather = WeatherModel.fromjson(data);

      return weather;
    } else {
      var data = jsonDecode(response.body);
      throw Exception(data['error']['message']);
    }
  }

  Future<String> getCurrentCity() async {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
    }

    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position position = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);

      List<Placemark> placeMarks = await placemarkFromCoordinates(
        position.latitude,
        position.longitude,
      );

      String? cityName = placeMarks[0].locality;
      return cityName ?? 'Unknown City';
    }

    return 'Permission Denied';
  }
 }
