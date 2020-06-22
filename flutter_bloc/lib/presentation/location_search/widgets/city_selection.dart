import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';

/// This widget build the input field which allows the user to search
/// for a location to receive its weather data.
class CitySelection extends StatelessWidget {
  final TextEditingController _textController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Form(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(left: 10.0),
              child: TextFormField(
                key: const Key('__Location_Search_Text_Form_Field__'),
                controller: _textController,
                decoration: const InputDecoration(
                  labelText: 'City',
                  hintText: 'Chicago',
                ),
              ),
            ),
          ),
          IconButton(
            key: const Key('__Location_Search_Icon_Button__'),
            icon: const Icon(Icons.search),
            onPressed: () {
              context.bloc<WeatherBloc>().add(
                  WeatherEvent.fetchWeatherForLocation(_textController.text));
              Navigator.pop(context);
            },
          )
        ],
      ),
    );
  }
}
