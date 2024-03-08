import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weathersearch/Cubit/weather_cubit.dart';

// ignore: must_be_immutable
class SearchPage extends StatelessWidget {
  SearchPage({Key? key}) : super(key: key);

  String? cityName;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search a City'),
      ),
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 34, horizontal: 12),
                child: TextFormField(
                  onChanged: (value) {
                    cityName = value;
                  },
                  onFieldSubmitted: (value) async {
                    cityName = value;

                    BlocProvider.of<WeatherCubit>(context, listen: false)
                        .getWeather(cityName: cityName!);

                    Navigator.pop(context);
                  },
                  keyboardType: TextInputType.text,
                  decoration: InputDecoration(
                    label: const Text(
                      'Search',
                      style: TextStyle(
                        fontSize: 24,
                      ),
                    ),
                    hintText: 'Enter City Name',
                    border: const OutlineInputBorder(),
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.search),
                      onPressed: () async {
                        BlocProvider.of<WeatherCubit>(context)
                            .getWeather(cityName: cityName!);

                        Navigator.pop(context);
                      },
                    ),
                  ),
                ),
              ),
            ]),
      ),
    );
  }
}
