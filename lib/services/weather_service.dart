import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weather_project/models/weather_model.dart';

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
}
