import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/temperature.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather_conditions.dart';

import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

class CombinedWeatherTemperature extends StatelessWidget {
  const CombinedWeatherTemperature({@required this.weatherResponse, Key key})
      : super(key: key);

  final model.WeatherResponse weatherResponse;

  @override
  Widget build(BuildContext context) {
    final model.Weather _weather = weatherResponse.weatherCollection.first;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: WeatherConditions(
                key: const Key('__Weather_Conditions__'),
                condition:
                    _weather.mapConditionToWeatherCondition(_weather.condition),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Temperature(
                _weather.temp,
                _weather.minTemp,
                _weather.maxTemp,
                key: const Key('__Temperature__'),
              ),
            ),
          ],
        ),
        Center(
            key: const Key('__Formatted_Weather_Condition__'),
            child: Text(
              weatherResponse.weatherCollection.first.formattedCondition,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.w200,
                color: Colors.white,
              ),
            )),
      ],
    );
  }
}
