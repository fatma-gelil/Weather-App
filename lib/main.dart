import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubits/cubit/get_weather_cubit.dart';
import 'package:test/cubits/cubit/get_weather_state.dart';
import 'package:test/services/weather_service.dart';
import 'package:test/views/home_view.dart';
import 'package:test/widgets/color_theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(WeatherService()),
      child: Builder(
        builder:
            (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
              builder: (context, state) {
                String? condition;
                if (state is GetWeatherSuccess) {
                  condition = state.weatherModel.condition;
                }
                return MaterialApp(
                  debugShowCheckedModeBanner: false,
                  theme: ThemeData(
                    primarySwatch: getThemeColor(condition),
                    appBarTheme: AppBarTheme(
                      backgroundColor: getThemeColor(condition),
                    ),
                  ),
                  home: HomeView(),
                );
              },
            ),
      ),
    );
  }
}
