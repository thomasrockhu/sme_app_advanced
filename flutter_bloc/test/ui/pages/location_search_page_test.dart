import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/location_search/pages/search_page.dart';
import 'package:flutter_bloc_example/presentation/location_search/widgets/city_selection.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Location Search Page', () {
    testWidgets('renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(MaterialApp(title: 'Test', home: SearchPage()));
      await tester.pumpAndSettle();
      expect(find.byType(Scaffold), findsOneWidget);
      expect(find.byType(AppBar), findsOneWidget);
      expect(
          find.descendant(of: find.byType(AppBar), matching: find.text('City')),
          findsOneWidget);
      expect(find.byType(CitySelection), findsOneWidget);
    });
  });
}
