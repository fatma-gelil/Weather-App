import 'package:bloc/bloc.dart';
import 'package:test/cubits/cubit/get_weather_state.dart';
import 'package:test/models/weather_model.dart';
import 'package:test/services/weather_service.dart';


class GetWeatherCubit extends Cubit<GetWeatherState> {
  GetWeatherCubit(this.weatherService) : super(GetWeatherInitial());
  WeatherService weatherService;
  WeatherModel? weatherModel;
  
  getCurrentWeather({required String cityName}) async {
    emit(GetWeatherLoading());
    try {
      weatherModel = await weatherService.getCurrentWeather(cityName: cityName);
      emit(GetWeatherSuccess(weatherModel!));
    } catch (e) {
      emit(GetWeatherCubitFail(e.toString()));
    }
  }

}
