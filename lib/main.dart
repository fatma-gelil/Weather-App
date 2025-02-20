import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/cubit/get_weather_cubit.dart';
import 'package:weather_project/cubits/cubit/get_weather_state.dart';
import 'package:weather_project/views/home_view.dart';
import 'package:weather_project/widgets/color_theme.dart';

void main() {
  runApp(const WeatherApp());
}

class WeatherApp extends StatelessWidget {
  const WeatherApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GetWeatherCubit(),
      child: Builder(
        builder: (context) => BlocBuilder<GetWeatherCubit, GetWeatherState>(
          builder: (context, state) {
            String? condition;
            if (state is GetWeatherSuccess) {
              print(state.weatherModel.condition);
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
              // ThemeData(
              //     primarySwatch: getThemeColor(
              //         BlocProvider.of<GetWeatherCubit>(context)
              //             .weatherModel
              //             ?.condition)),
              //  ThemeData(
              //   primarySwatch: getThemeColor(
              //       BlocProvider.of<GetWeatherCubit>(context)
              //           .weatherModel
              //           ?.condition),
              // ),

              home: HomeView(),
            );
          },
        ),
      ),
    );
  }
}
