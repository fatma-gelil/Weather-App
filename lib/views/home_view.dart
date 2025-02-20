import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/cubit/get_weather_cubit.dart';
import 'package:weather_project/cubits/cubit/get_weather_state.dart';
import 'package:weather_project/views/search_view.dart';
import 'package:weather_project/widgets/no_weather_body.dart';
import 'package:weather_project/widgets/weather_info_body.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //backgroundColor: Colors.blue,
        centerTitle: true,
        elevation: 10,
        title: Text(
          'Weather App',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        actions: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) {
                      return  SearchView();
                    },
                  ),
                );
              },
              icon: const Padding(
                padding: EdgeInsets.only(right: 20),
                child: Icon(
                  Icons.search,
                  size: 30,
                  color: Colors.white,
                ),
              ))
        ],
      ),
      body: BlocBuilder<GetWeatherCubit,GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherInitial) {
            return  NoWeatherBody();
          } else if (state is GetWeatherSuccess) {
            return WeatherInfoBody(weather: state.weatherModel);
          } else if (state is GetWeatherLoading) {
            return Center(child: CircularProgressIndicator());
          } else {
            return Text('oops there was an error');
          }
        },
      ),
    );
  }
}
