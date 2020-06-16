import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Weather State', () {
    group('WeatherInitial', () {
      test('toString returns correct value', () {
        expect(
            const WeatherState.initial().toString(), 'WeatherState.initial()');
      });
    });
    group('WeatherLoading', () {
      test('toString returns correct value', () {
        expect(
            const WeatherState.loading().toString(), 'WeatherState.loading()');
      });
    });
    group('WeatherLoadingFailure', () {
      test('toString returns correct value', () {
        expect(const WeatherState.loadingFailure().toString(),
            'WeatherState.loadingFailure()');
      });
    });
    group('WeatherLoaded', () {
      test('toString returns correct value', () {
        expect(WeatherState.loaded(WeatherEntity.initial()).toString(),
            'WeatherState.loaded(weatherEntity: WeatherEntity(weatherResponse: None, city: , lastUpdated: None))');
      });
    });
  });
}
