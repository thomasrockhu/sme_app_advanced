import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:test/test.dart';

void main() {
  group('SettingsBloc', () {
    SettingsBloc settingsBloc;

    setUp(() {
      settingsBloc = SettingsBloc();
    });

    test('should check if initial state is WeatherState.initial()', () {
      expect(settingsBloc.initialState, SettingsState.celcius());
    });

    blocTest(
        'should emit SettingsState.celcius when event is ToggleTemperatureUnit(true)',
        build: () async => settingsBloc,
        act: (SettingsBloc bloc) async {
          bloc.add(const ToggleTemperatureUnit(false));
          bloc.add(const ToggleTemperatureUnit(true));
        },
        expect: [SettingsState.fahrenheit(), SettingsState.celcius()]);
    blocTest(
        'should emit SettingsState.fahrenheit when event is ToggleTemperatureUnit(false)',
        build: () async => settingsBloc,
        act: (SettingsBloc bloc) async {
          bloc.add(const ToggleTemperatureUnit(false));
        },
        expect: [SettingsState.fahrenheit()]);
  });
}
