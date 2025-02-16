import 'package:bloc/bloc.dart';
import 'package:weather_project/cubits/cubit/get_weather_state.dart';
import 'package:weather_project/models/weather_model.dart';
import 'package:weather_project/services/weather_service.dart';

class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit() : super(GetWeatherInitial());
  getCurrentWeather({required String cityName}) async {
    try {
      WeatherModel weatherModel =
          await WeatherService().getCurrentWeather(cityName: cityName);
      emit(GetWeatherSuccess(weatherModel));
    } catch (e) {
      emit(GetWeatherCubitFail());
    }
  }
}
