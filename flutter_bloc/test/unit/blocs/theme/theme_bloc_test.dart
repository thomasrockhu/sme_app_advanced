import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:test/test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  group('ThemeBloc', () {
    ThemeBloc themeBloc;
    WeatherCondition weatherCondition;
    final ThemeEntity forClearWeatherCondition = ThemeEntity(
      themeData: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      materialColor: Colors.yellow,
    );
    final ThemeEntity initial = ThemeEntity.initial();

    setUp(() {
      themeBloc = ThemeBloc();
      weatherCondition = WeatherCondition.clear;
    });

    test(
        'should check if initial state is ThemeState and contains theme entity initial',
        () {
      expect(themeBloc.initialState, ThemeState(themeEntity: initial));
    });

    blocTest(
        'should emit ThemeState(forClearWeatherCondition) in response to WeatherCondition.clear',
        build: () async => themeBloc,
        act: (ThemeBloc bloc) async {
          bloc.add(WeatherChanged(weatherCondition));
        },
        expect: [ThemeState(themeEntity: forClearWeatherCondition)]);
    blocTest(
        'should emit ThemeState(ThemeEntity.inital) in response to WeatherCondition.unknown',
        build: () async => themeBloc,
        act: (ThemeBloc bloc) async {
          bloc.add(const WeatherChanged(WeatherCondition.clear));
          bloc.add(const WeatherChanged(WeatherCondition.unknown));
        },
        expect: [
          ThemeState(themeEntity: forClearWeatherCondition),
          ThemeState(themeEntity: initial)
        ]);
  });
}
