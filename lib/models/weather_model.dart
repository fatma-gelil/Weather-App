

class WeatherModel {
  final String cityName;
  final DateTime date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String image;

  WeatherModel(
      {required this.cityName,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      required this.image,
      required this.condition});

//anyyyy api from the internet mustttt have factory model
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        cityName: json['location']['name'],
        date: DateTime.parse(json['current']['last_updated']),
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
