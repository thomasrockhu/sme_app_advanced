import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather Event', () {
    group('FetchWeatherEvent', () {
      test('toString returns correct value', () {
        expect(const WeatherEvent.fetchWeatherForLocation('London').toString(),
            'WeatherEvent.fetchWeatherForLocation(location: London)');
      });
    });
    group('RefreshWeatherEvent', () {
      test('toString returns correct value', () {
        expect(
            const WeatherEvent.refreshWeatherForLocation('London').toString(),
            'WeatherEvent.refreshWeatherForLocation(location: London)');
      });
    });
  });
}
