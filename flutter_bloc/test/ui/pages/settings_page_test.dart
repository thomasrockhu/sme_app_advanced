import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc_example/application/settings/settings_bloc.dart';
import 'package:flutter_bloc_example/presentation/settings/pages/settings_page.dart';
import 'package:flutter_bloc_example/presentation/settings/widgets/settings.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

class MockSettingsBloc extends MockBloc<SettingsEvent, SettingsState>
    implements SettingsBloc {}

void main() {
  group('Settings Page', () {
    SettingsBloc _settingsBloc;

    setUp(() {
      _settingsBloc = MockSettingsBloc();
    });
    testWidgets('renders correctly', (WidgetTester tester) async {
      when(_settingsBloc.state).thenAnswer((_) => SettingsState.celcius());
      await tester.pumpWidget(BlocProvider<SettingsBloc>.value(
          value: _settingsBloc,
          child: MaterialApp(title: 'Test', home: SettingsPage())));
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(
          find.descendant(
              of: find.byType(AppBar), matching: find.text('Settings')),
          findsOneWidget);
      expect(find.byType(Settings), findsOneWidget);
    });
  });
}
