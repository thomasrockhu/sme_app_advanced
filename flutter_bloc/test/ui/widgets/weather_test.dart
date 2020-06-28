import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/gradient_container.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/last_updated.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/location.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

class MockWeatherResponse extends Mock implements model.WeatherResponse {}

class MockWeather extends Mock implements model.Weather {}

void main() {
  group('Weather Widget', () {
    SettingsBloc _settingsBloc;
    WeatherBloc _weatherBloc;
    ThemeBloc _themeBloc;
    model.WeatherResponse _weatherResponse;
    List<model.Weather> _weatherCollection;
    model.Weather _weather;

    setUp(() {
      _settingsBloc = MockSettingsBloc();
      _weatherBloc = MockWeatherBloc();
      _themeBloc = MockThemeBloc();
      _weatherResponse = MockWeatherResponse();
      _weather = MockWeather();
      _weatherCollection = List<MockWeather>.from([_weather]);
    });

    testWidgets('should render properly for WeatherState.initial',
        (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const Initial());
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Weather(),
            ),
          ),
        ),
      );
      expect(find.byType(Center), findsNWidgets(2));
      expect(find.text('Please Select a Location'), findsOneWidget);
    });

    testWidgets('should render properly for WeatherState.loading',
        (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const Loading());
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Weather(),
            ),
          ),
        ),
      );
      expect(find.byType(Center), findsNWidgets(2));
      expect(find.byType(CircularProgressIndicator), findsOneWidget);
    });

    testWidgets('should render properly for WeatherState.loadingFailure',
        (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const LoadingFailure());
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Weather(),
            ),
          ),
        ),
      );
      expect(find.byType(Center), findsOneWidget);
      expect(find.text('Something went wrong!'), findsOneWidget);
    });

    testWidgets('should render properly for WeatherState.loaded',
        (WidgetTester tester) async {
      when(_weatherBloc.state)
          .thenAnswer((_) => Loaded(WeatherEntity.initial()));
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      when(_themeBloc.state)
          .thenAnswer((_) => ThemeState(themeEntity: ThemeEntity.initial()));
      when(_weatherResponse.weatherCollection)
          .thenAnswer((_) => _weatherCollection);
      when(_weather.mapConditionToWeatherCondition(_weather.condition))
          .thenAnswer((_) => model.WeatherCondition.clear);
      when(_weather.temp).thenAnswer((_) => 20);
      when(_weather.minTemp).thenAnswer((_) => 19);
      when(_weather.maxTemp).thenAnswer((_) => 21);
      when(_weather.formattedCondition).thenAnswer((_) => 'TEST');
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>.value(
              value: _weatherBloc,
            ),
            BlocProvider<SettingsBloc>.value(
              value: _settingsBloc,
            ),
            BlocProvider<ThemeBloc>.value(
              value: _themeBloc,
            ),
          ],
          child: MaterialApp(
            home: Scaffold(body: BlocBuilder<ThemeBloc, ThemeState>(
                builder: (context, themeState) {
              return GradientContainer(
                color: themeState.themeEntity.materialColor,
                child: ListView(
                  children: <Widget>[
                    const Padding(
                      padding: EdgeInsets.only(top: 100.0),
                      child: Center(
                        child: Location(
                          location: 'London',
                        ),
                      ),
                    ),
                    Center(
                      child: LastUpdated(
                        dateTime: DateTime.now(),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 50.0),
                      child: Center(
                        child: CombinedWeatherTemperature(
                          weatherResponse: _weatherResponse,
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Center), findsWidgets);
      expect(find.byType(Padding), findsWidgets);
      expect(find.byType(GradientContainer), findsOneWidget);
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(Location), findsOneWidget);
      expect(find.byType(LastUpdated), findsOneWidget);
      expect(find.byType(CombinedWeatherTemperature), findsOneWidget);
    });
  });
}
