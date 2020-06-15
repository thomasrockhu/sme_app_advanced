import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  group('Theme Event', () {
    group('WeatherChanged', () {
      test('toString returns correct value', () {
        const WeatherCondition weatherCondition = WeatherCondition.clear;
        expect(const ThemeEvent.weatherChanged(weatherCondition).toString(),
            'ThemeEvent.weatherChanged(weatherCondition: $weatherCondition)');
      });
    });
  });
}
