import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Settings State', () {
    group('SettingsState.celsius()', () {
      test('toString returns correct value', () {
        expect(SettingsState.celcius().toString(),
            'SettingsState(temperatureUnit: TemperatureUnit.celsius)');
      });
    });
    group('SettingsState.fahrenheit()', () {
      test('toString returns correct value', () {
        expect(SettingsState.fahrenheit().toString(),
            'SettingsState(temperatureUnit: TemperatureUnit.fahrenheit)');
      });
    });
  });
}
