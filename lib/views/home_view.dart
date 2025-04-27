import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:test/cubits/cubit/get_weather_cubit.dart';
import 'package:test/cubits/cubit/get_weather_state.dart';
import 'package:test/services/weather_service.dart';
import 'package:test/views/search_view.dart';
import 'package:test/widgets/no_weather_body.dart';
import 'package:test/widgets/weather_info_body.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
    _fetchweather();
  }

  final _weatherService = WeatherService();
  //fetch the current location weather
  _fetchweather() async {
    // get the current city
    String cityName = await _weatherService.getCurrentCity();
    // get the weather of the city
    if (!mounted) return;
    try {
      BlocProvider.of<GetWeatherCubit>(
        context,
      ).getCurrentWeather(cityName: cityName);
    } on Exception {
      return NoWeatherBody();
      //print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                    return SearchView();
                  },
                ),
              );
            },
            icon: const Padding(
              padding: EdgeInsets.only(right: 20),
              child: Icon(Icons.search, size: 30, color: Colors.white),
            ),
          ),
        ],
      ),
      body: BlocBuilder<GetWeatherCubit, GetWeatherState>(
        builder: (context, state) {
          if (state is GetWeatherInitial) {
            return NoWeatherBody();
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
