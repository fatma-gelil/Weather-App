
import 'package:flutter/material.dart';

MaterialColor getThemeColor(String? condition) {
  switch (condition) {
    case 'Sunny':
      return Colors.orange;
    case 'Clear':
      return Colors.blueGrey;
    case 'Partly cloudy':
      return Colors.lightBlue;
    case 'Cloudy':
      return Colors.grey;
    case 'Overcast':
      return Colors.blueGrey;
    case 'Mist':
      return Colors.teal;
    case 'Patchy rain possible':
    case 'Light drizzle':
    case 'Light rain':
      return Colors.lightBlue;
    case 'Moderate rain at times':
    case 'Moderate rain':
      return Colors.blue;
    case 'Heavy rain at times':
    case 'Heavy rain':
      return Colors.indigo;
    case 'Thundery outbreaks possible':
    case 'Patchy light rain with thunder':
    case 'Moderate or heavy rain with thunder':
      return Colors.deepPurple;
    case 'Patchy snow possible':
    case 'Light snow':
    case 'Patchy light snow':
      return Colors.blueGrey;
    case 'Moderate snow':
    case 'Patchy moderate snow':
      return Colors.blue;
    case 'Heavy snow':
    case 'Patchy heavy snow':
      return Colors.indigo;
    case 'Ice pellets':
    case 'Light sleet':
    case 'Moderate or heavy sleet':
      return Colors.cyan;
    case 'Fog':
    case 'Freezing fog':
      return Colors.grey;
    case 'Blizzard':
      return Colors.blueGrey;
    default:
      return Colors.blue;
  }
}