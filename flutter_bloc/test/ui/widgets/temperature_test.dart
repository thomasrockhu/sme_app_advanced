import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/temperature.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  SettingsBloc _settingsBloc;
  const double temp = 20.0;
  const double minTemp = 19.0;
  const double maxTemp = 21.0;

  setUp(() {
    _settingsBloc = MockSettingsBloc();
  });
  group('Temperature Widget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(BlocProvider<SettingsBloc>.value(
        value: _settingsBloc,
        child: const MaterialApp(
          home: Scaffold(
            body: Temperature(temp, minTemp, maxTemp),
          ),
        ),
      ));
      expect(find.byType(Column), findsWidgets);
      expect(find.byType(Row), findsWidgets);
      expect(find.byType(Padding), findsOneWidget);
      expect(find.text('20°C'), findsOneWidget);
      expect(find.text('min 19°C'), findsOneWidget);
      expect(find.text('max 21°C'), findsOneWidget);
    });
    test('should check if formatting method works correctly', () {
      expect(_formattedTemperature(0.0), 32);
      expect(_formattedTemperature(10.0), 50);
    });
    testWidgets('should render correctly for SettingsState.fahrenheit',
        (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.fahrenheit());
      await tester.pumpWidget(BlocProvider<SettingsBloc>.value(
        value: _settingsBloc,
        child: const MaterialApp(
          home: Scaffold(
            body: Temperature(temp, minTemp, maxTemp),
          ),
        ),
      ));
      final fTemp = _formattedTemperature(temp);
      final fminTemp = _formattedTemperature(minTemp);
      final fmaxTemp = _formattedTemperature(maxTemp);
      expect(find.text('$fTemp°F'), findsOneWidget);
      expect(find.text('min $fminTemp°F'), findsOneWidget);
      expect(find.text('max $fmaxTemp°F'), findsOneWidget);
    });
  });
}

int _formattedTemperature(double t) {
  final int fTemp = ((t * 9 / 5) + 32).round();
  return fTemp;
}
