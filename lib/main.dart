// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:weathersearch/Cubit/weather_cubit.dart';
import 'package:weathersearch/Models/weather_model.dart';
import 'package:weathersearch/Services/weather_services.dart';
import 'package:weathersearch/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  WeatherModel? weather;
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Provider(
      create: (context) {
        return WeatherCubit(weatherSevices: WeatherSevices()).weatherModel;
      },
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomePage(),
      ),
    );
  }
}
