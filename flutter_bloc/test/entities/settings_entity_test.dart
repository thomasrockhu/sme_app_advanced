import 'package:flutter_bloc_example/domain/settings/settings_entity.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  group('Settings Entity', () {
    test(
        'should check if the factory method SettingsEntity.celsius() is creating the correct object',
        () {
      final SettingsEntity _celsius = SettingsEntity.celsius();
      expect(_celsius.temperatureUnit, TemperatureUnit.celsius);
    });
    test(
        'should check if the factory method SettingsEntity.fahrenheit() is creating the correct object',
        () {
      final SettingsEntity _fahrenheit = SettingsEntity.fahrenheit();
      expect(_fahrenheit.temperatureUnit, TemperatureUnit.fahrenheit);
    });
  });
}
