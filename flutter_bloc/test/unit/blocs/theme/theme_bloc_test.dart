import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:test/test.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

void main() {
  group('ThemeBloc', () {
    ThemeBloc themeBloc;
    final ThemeEntity forClearWeatherCondition = ThemeEntity(
      themeData: ThemeData(
        primaryColor: Colors.orangeAccent,
      ),
      materialColor: Colors.yellow,
    );
    final ThemeEntity forSnowWeatherCondition = ThemeEntity(
      themeData: ThemeData(
        primaryColor: Colors.lightBlueAccent,
      ),
      materialColor: Colors.lightBlue,
    );
    final ThemeEntity forHeavyCloudWeatherCondition = ThemeEntity(
      themeData: ThemeData(
        primaryColor: Colors.blueGrey,
      ),
      materialColor: Colors.grey,
    );
    final ThemeEntity forShowersWeatherCondition = ThemeEntity(
      themeData: ThemeData(
        primaryColor: Colors.indigoAccent,
      ),
      materialColor: Colors.indigo,
    );
    final ThemeEntity forThunderstormWeatherCondition = ThemeEntity(
      themeData: ThemeData(
        primaryColor: Colors.deepPurpleAccent,
      ),
      materialColor: Colors.deepPurple,
    );
    final ThemeEntity initial = ThemeEntity.initial();

    setUp(() {
      themeBloc = ThemeBloc();
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
          bloc.add(const WeatherChanged(WeatherCondition.clear));
        },
        expect: [ThemeState(themeEntity: forClearWeatherCondition)]);
    blocTest(
        'should emit ThemeState(forClearWeatherCondition) in response to WeatherCondition.snow',
        build: () async => themeBloc,
        act: (ThemeBloc bloc) async {
          bloc.add(const WeatherChanged(WeatherCondition.snow));
        },
        expect: [ThemeState(themeEntity: forSnowWeatherCondition)]);
    blocTest(
        'should emit ThemeState(forClearWeatherCondition) in response to WeatherCondition.heavyCloud',
        build: () async => themeBloc,
        act: (ThemeBloc bloc) async {
          bloc.add(const WeatherChanged(WeatherCondition.heavyCloud));
        },
        expect: [ThemeState(themeEntity: forHeavyCloudWeatherCondition)]);
    blocTest(
        'should emit ThemeState(forClearWeatherCondition) in response to WeatherCondition.showers',
        build: () async => themeBloc,
        act: (ThemeBloc bloc) async {
          bloc.add(const WeatherChanged(WeatherCondition.showers));
        },
        expect: [ThemeState(themeEntity: forShowersWeatherCondition)]);
    blocTest(
        'should emit ThemeState(forClearWeatherCondition) in response to WeatherCondition.thunderstorm',
        build: () async => themeBloc,
        act: (ThemeBloc bloc) async {
          bloc.add(const WeatherChanged(WeatherCondition.thunderstorm));
        },
        expect: [ThemeState(themeEntity: forThunderstormWeatherCondition)]);
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
