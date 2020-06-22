import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/weather_conditions.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  const WeatherCondition _weatherCondition = WeatherCondition.hail;
  group('Weather Conditions Widget', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: WeatherConditions(
              condition: _weatherCondition,
            ),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Image && widget.key == Key(_weatherCondition.toString()));
      expect(finder, findsOneWidget);
    });
  });
}
