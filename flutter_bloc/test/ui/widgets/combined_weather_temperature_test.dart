import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/temperature.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather_conditions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';
import 'package:mockito/mockito.dart';
import 'package:bloc_test/bloc_test.dart';

class MockWeatherResponse extends Mock implements WeatherResponse {}

class MockWeather extends Mock implements Weather {}

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  WeatherResponse _weatherResponse;
  List<Weather> _weatherCollection;
  Weather _weather;
  SettingsBloc _settingsBloc;

  setUp(() {
    _weatherResponse = MockWeatherResponse();
    _weather = MockWeather();
    _weatherCollection = List<MockWeather>.from([_weather]);
    _settingsBloc = MockSettingsBloc();
    // _weatherCollection.add(_weather);
  });
  group('Combined Weather Temperature Widget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      when(_weatherResponse.weatherCollection)
          .thenAnswer((_) => _weatherCollection);
      // when(_weatherCollection.first).thenAnswer((_) => _weather);
      when(_weather.mapConditionToWeatherCondition(_weather.condition))
          .thenAnswer((_) => WeatherCondition.clear);
      when(_weather.temp).thenAnswer((_) => 20);
      when(_weather.minTemp).thenAnswer((_) => 19);
      when(_weather.maxTemp).thenAnswer((_) => 21);
      when(_weather.formattedCondition).thenAnswer((_) => 'TEST');
      await tester.pumpWidget(BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
              home: Scaffold(
                  body: CombinedWeatherTemperature(
                      weatherResponse: _weatherResponse)))));
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(WeatherConditions), findsOneWidget);
      expect(find.byType(Temperature), findsOneWidget);
      expect(find.byType(Center), findsOneWidget);
      expect(find.text('TEST'), findsOneWidget);
    });
  });
}
