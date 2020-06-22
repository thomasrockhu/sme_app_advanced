import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/last_updated.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final DateTime _tDate = DateTime.now();
  group('Last Updated Widget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: LastUpdated(dateTime: _tDate),
          ),
        ),
      );
      final finder = find.byWidgetPredicate((widget) =>
          widget is Text && widget.data.contains(_tDate.minute.toString()));
      expect(finder, findsOneWidget);
    });
  });
}
