import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/presentation/location_search/pages/search_page.dart';
import 'package:flutter_bloc_example/presentation/settings/pages/settings_page.dart';
import 'package:flutter_bloc_example/presentation/weather/pages/weather_page.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  group('Weather Page', () {
    WeatherBloc _weatherBloc;
    SettingsBloc _settingsBloc;

    setUp(() {
      _weatherBloc = MockWeatherBloc();
      _settingsBloc = MockSettingsBloc();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const Initial());
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            title: 'Test',
            home: WeatherPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(AppBar),
            matching: find.text('Flutter_Bloc Weather'),
          ),
          findsOneWidget);
      expect(find.byType(IconButton), findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(IconButton),
            matching: find.byType(Icon),
          ),
          findsOneWidget);
      expect(find.byType(FloatingActionButton), findsOneWidget);
      expect(
          find.descendant(
            of: find.byType(FloatingActionButton),
            matching: find.byType(Icon),
          ),
          findsOneWidget);
      expect(find.byType(Weather), findsOneWidget);
    });
    testWidgets('navigates to Settings Page when App Bar Icon Button is tapped',
        (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const Initial());
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(
        MultiBlocProvider(
          providers: [
            BlocProvider<WeatherBloc>.value(value: _weatherBloc),
            BlocProvider<SettingsBloc>.value(value: _settingsBloc)
          ],
          child: MaterialApp(
            title: 'Test',
            home: WeatherPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byIcon(Icons.settings));
      await tester.pumpAndSettle();
      expect(find.byType(SettingsPage), findsOneWidget);
    });
    testWidgets(
        'navigates to Location Search Page when Floating Action Button is tapped',
        (WidgetTester tester) async {
      when(_weatherBloc.state).thenAnswer((_) => const Initial());
      await tester.pumpWidget(
        BlocProvider<WeatherBloc>.value(
          value: _weatherBloc,
          child: MaterialApp(
            title: 'Test',
            home: WeatherPage(),
          ),
        ),
      );
      await tester.pumpAndSettle();
      await tester.tap(find.byType(FloatingActionButton));
      await tester.pumpAndSettle();
      expect(find.byType(SearchPage), findsOneWidget);
    });
  });
}
