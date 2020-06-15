import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Settings Event', () {
    group('ToggleTemperatureUnit', () {
      test('toString returns correct value', () {
        expect(const SettingsEvent.toggleTemperatureUnit(true).toString(),
            'SettingsEvent.toggleTemperatureUnit(value: true)');
      });
    });
  });
}
