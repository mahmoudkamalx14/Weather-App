import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:weathersearch/Models/weather_model.dart';

class WeatherSevices {
  String baseUrl = 'https://api.weatherapi.com/v1';

  String apiKey = '93748ac56cdf46e4bdf145333232404';
  Future<WeatherModel> getWeather({required String cityName}) async {
    Uri url =
        Uri.parse('$baseUrl/forecast.json?key=$apiKey&q=$cityName&days=4');
    http.Response response = await http.get(url);

    Map<String, dynamic> data = jsonDecode(response.body);

    WeatherModel weather = WeatherModel.fromJson(data);

    return weather;
  }
}
