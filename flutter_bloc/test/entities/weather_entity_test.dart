import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class MockWeatherResponse extends Mock implements WeatherResponse {}

void main() {
  group('Weather Entity', () {
    final WeatherResponse _weatherResponse = MockWeatherResponse();
    test(
        'should check if the factory method WeatherEntity.initial() is creating the correct object',
        () {
      final WeatherEntity _initial = WeatherEntity.initial();
      expect(WeatherEntity.initial(), _initial);
    });
    test('should check if the factory constructor is working correctly', () {
      final DateTime _tDateTime = DateTime.now();
      final WeatherEntity _tWeatherEntity = WeatherEntity(
          weatherResponse: some(_weatherResponse),
          city: 'London',
          lastUpdated: some(_tDateTime));
      final WeatherEntity _tWeatherEntity2 = WeatherEntity(
          weatherResponse: some(_weatherResponse),
          city: 'London',
          lastUpdated: some(_tDateTime));
      expect(_tWeatherEntity, _tWeatherEntity2);
    });
  });
}
