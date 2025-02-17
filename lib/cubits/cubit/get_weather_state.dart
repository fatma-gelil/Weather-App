import 'package:weather_project/models/weather_model.dart';

sealed class GetWeatherState {}

final class GetWeatherInitial extends GetWeatherState {}

final class GetWeatherLoading extends GetWeatherState {}

final class GetWeatherSuccess extends GetWeatherState {
  WeatherModel weatherModel;
  GetWeatherSuccess(this.weatherModel);
}

final class GetWeatherCubitFail extends GetWeatherState {
  final String errorMessage;
  GetWeatherCubitFail(this.errorMessage);
}
