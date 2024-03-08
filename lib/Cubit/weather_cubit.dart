// ignore_for_file: unused_catch_clause

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathersearch/Cubit/weather_state.dart';
import 'package:weathersearch/Models/weather_model.dart';
import 'package:weathersearch/Services/weather_services.dart';

class WeatherCubit extends Cubit<WeatherState> {
  WeatherCubit({required this.weatherSevices}) : super(WeatherInsilition());
  WeatherSevices weatherSevices;

  WeatherModel? weatherModel;
  void getWeather({required String cityName}) async {
    emit(WeatherLoading());
    try {
      weatherModel = await weatherSevices.getWeather(cityName: cityName);
      emit(WeatherSuccess());
    } on Exception catch (e) {
      emit(WeatherFailure());
    }
  }
}
