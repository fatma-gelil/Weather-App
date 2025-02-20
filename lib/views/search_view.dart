import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_project/cubits/cubit/get_weather_cubit.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: const Text(
          'Search City',
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Center(
          child: TextField(
            onSubmitted: (value) async {
              // var getWeatherCubit = BlocProvider.of<GetWeatherCubit>(context);
              // getWeatherCubit.getCurrentWeather(cityName: value);
      
              BlocProvider.of<GetWeatherCubit>(context)
                  .getCurrentWeather(cityName: value);
      
              Navigator.pop(context);
            },
            decoration:InputDecoration(
              contentPadding: EdgeInsets.all(25),
              hintText: 'Enter City Name',
              labelText: 'Search',
              suffixIcon: Icon(Icons.search),
              border: OutlineInputBorder(
                borderSide: BorderSide(color: Colors.blue),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
