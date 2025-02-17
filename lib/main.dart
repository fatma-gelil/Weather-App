import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/cubit/get_weather_cubit.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/views/home_view.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: getThemeColor(),
        ),
        home: HomeView(),
      ),
    );
  }


MaterialColor getThemeColor(String condition) {
  switch (condition.toLowerCase()) {
    case 'sunny':
      return Colors.orange;
    case 'clear':
      return Colors.blueGrey;
    case 'partly cloudy':
      return Colors.lightBlue;
    case 'cloudy':
      return Colors.grey;
    case 'overcast':
      return Colors.blueGrey;
    case 'mist':
      return Colors.teal;
    case 'patchy rain possible':
    case 'light drizzle':
    case 'light rain':
      return Colors.lightBlue;
    case 'moderate rain at times':
    case 'moderate rain':
      return Colors.blue;
    case 'heavy rain at times':
    case 'heavy rain':
      return Colors.indigo;
    case 'thundery outbreaks possible':
    case 'patchy light rain with thunder':
    case 'moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'patchy snow possible':
    case 'light snow':
    case 'patchy light snow':
      return Colors.blueGrey;
    case 'moderate snow':
    case 'patchy moderate snow':
      return Colors.blue;
    case 'heavy snow':
    case 'patchy heavy snow':
      return Colors.indigo;
    case 'ice pellets':
    case 'light sleet':
    case 'moderate or heavy sleet':
      return Colors.cyan;
    case 'fog':
    case 'freezing fog':
      return Colors.grey;
    case 'blizzard':
      return Colors.blueGrey;
    default:
      return Colors.blue; 
  }
}

}


