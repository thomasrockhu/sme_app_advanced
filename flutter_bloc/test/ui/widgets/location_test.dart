import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Location Widget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: Location(location: 'London'),
          ),
        ),
      );
      expect(find.text('London'), findsOneWidget);
    });
  });
}
