import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/gradient_container.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Gradient Container Widget', () {
    testWidgets('should render correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: GradientContainer(color: Colors.blue, child: Text('Test')),
          ),
        ),
      );
      expect(find.byType(Container), findsOneWidget);
      expect(find.text('Test'), findsOneWidget);
    });
  });
}
