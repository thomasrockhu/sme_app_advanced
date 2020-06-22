import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/location_search/widgets/city_selection.dart';

/// This widget functions as a container for the location search screen.
///
/// It builds a scaffold and contains the search content.
class SearchPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          key: const Key('__Location_Search_App_Bar__'),
          title: const Text('City'),
        ),
        body: CitySelection());
  }
}
