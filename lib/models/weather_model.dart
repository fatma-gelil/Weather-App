

class WeatherModel {
  final String city;
  final String date;
  final double temp;
  final double minTemp;
  final double maxTemp;
  final String condition;
  final String? image;

  WeatherModel(
      {required this.city,
      required this.date,
      required this.temp,
      required this.minTemp,
      required this.maxTemp,
      this.image,
      required this.condition});

//anyyyy api from the internet mustttt have factory model
  factory WeatherModel.fromjson(json) {
    return WeatherModel(
        city: json['location']['name'],
        date: json['current']['last_updated'],
        temp: json['forecast']['forecastday'][0]['day']['avgtemp_c'],
        minTemp: json['forecast']['forecastday'][0]['day']['mintemp_c'],
        maxTemp: json['forecast']['forecastday'][0]['day']['maxtemp_c'],
        condition: json['forecast']['forecastday'][0]['day']['condition']['text'],
        image: json['forecast']['forecastday'][0]['day']['condition']['icon']);
  }
}
