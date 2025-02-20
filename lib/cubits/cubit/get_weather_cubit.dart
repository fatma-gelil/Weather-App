import 'package:bloc/bloc.dart';
import 'package:weather_project/cubits/cubit/get_weather_state.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/services/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());
   WeatherModel? weatherModel;
  getCurrentWeather({required String cityName}) async {
    try {
      weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityName);
      emit(GetWeatherSuccess(weatherModel!));
    } catch (e) {
      emit(GetWeatherCubitFail(e.toString()));
    }
  }
}
