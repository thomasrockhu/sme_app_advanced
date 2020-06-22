import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/blocs.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_bloc_example/presentation/weather/pages/weather_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockThemeBloc extends MockBloc<ThemeEvent, ThemeState>
    implements ThemeBloc {}

void main() {
  SettingsBloc _settingsBloc;
  WeatherBloc _weatherBloc;
  ThemeBloc _themeBloc;
  ThemeEntity _themeEntity;

  setUp(() {
    _settingsBloc = MockSettingsBloc();
    _weatherBloc = MockWeatherBloc();
    _themeBloc = MockThemeBloc();
    _themeEntity = ThemeEntity.initial();
  });

  group('Flutter Bloc App Widget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const Initial());
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      when(_themeBloc.state)
          .thenAnswer((_) => ThemeState(themeEntity: _themeEntity));
      await tester.pumpWidget(BlocBuilder<ThemeBloc, ThemeState>(
          bloc: _themeBloc,
          builder: (context, themeState) {
            return MultiBlocProvider(
              providers: [
                BlocProvider<WeatherBloc>.value(value: _weatherBloc),
                BlocProvider<ThemeBloc>.value(value: _themeBloc),
                BlocProvider<SettingsBloc>.value(value: _settingsBloc),
              ],
              child: MaterialApp(
                title: 'Flutter Demo',
                theme: themeState.themeEntity.themeData,
                home: WeatherPage(),
              ),
            );
          }));
      expect(find.byType(MaterialApp), findsOneWidget);
      final MaterialApp _ma =
          find.byType(MaterialApp).evaluate().first.widget as MaterialApp;
      expect(_ma.theme, _themeEntity.themeData);
    });
  });
}
