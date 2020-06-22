import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/presentation/settings/widgets/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:mockito/mockito.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  group('Settings Widget', () {
    SettingsBloc _settingsBloc;

    setUp(() {
      _settingsBloc = MockSettingsBloc();
    });
    testWidgets('should render correctly', (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      expect(find.byType(ListView), findsOneWidget);
      expect(find.byType(ListTile), findsOneWidget);
      expect(find.text('Temperature Units'), findsOneWidget);
      expect(find.byType(Switch), findsOneWidget);
    });

    testWidgets(
        'should verify that the switch is toggled to inactive when Temperature Unit is TemperatureUnit.fahrenheit',
        (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.fahrenheit());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == false);
      expect(finder, findsOneWidget);
    });

    testWidgets(
        'should verify that the switch is toggled to active when Temperature Unit is TemperatureUnit.celcius',
        (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(
        BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(
            home: Scaffold(
              body: Settings(),
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate(
          (widget) => widget is Switch && widget.value == true);
      expect(finder, findsOneWidget);
    });
  });
}
