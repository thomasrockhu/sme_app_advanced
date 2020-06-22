import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/combined_weather_temperature.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/gradient_container.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/last_updated.dart';
import 'package:flutter_bloc_example/presentation/weather/widgets/location.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';

import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart'
    as model;

/// This widget builds the content of the weather screen.
class Weather extends StatefulWidget {
  @override
  State<Weather> createState() => _WeatherState();
}

class _WeatherState extends State<Weather> {
  Completer<void> _refreshCompleter;

  @override
  void initState() {
    super.initState();
    _refreshCompleter = Completer<void>();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
        key: const Key('__Weather_Page_Content__'), child: _buildUI(context));
  }

  Widget _buildUI(BuildContext context) {
    // Rebuilds the weather content whenever a new WeatherState is received.
    return BlocConsumer<WeatherBloc, WeatherState>(listener: (context, state) {
      if (state is Loaded) {
        final model.Weather _weather = state.weatherEntity.weatherResponse
            .getOrElse(() => null)
            .weatherCollection
            .first;
        // Adds the ThemeEvent weatherChanged to the event stream when the WeatherState is loaded.
        context.bloc<ThemeBloc>().add(
              ThemeEvent.weatherChanged(
                _weather.mapConditionToWeatherCondition(_weather.condition),
              ),
            );
        _refreshCompleter?.complete();
        _refreshCompleter = Completer();
      }
    }, builder: (context, state) {
      return state.map(
        initial: (_) => _buildIdle(),
        loading: (_) => _buildLoading(),
        loadingFailure: (_) => _buildError(),
        loaded: (state) => _buildWeather(context, state),
      );
      // if (state is LoadingFailure) {
      //   return _buildError();
      // }
      // if (state is Loading) {
      //   return _buildLoading();
      // }
      // if (state is Loaded) {
      //   return _buildWeather(context, state);
      // }
      // return _buildIdle();
    });
  }

  Widget _buildWeather(BuildContext context, Loaded state) {
    return BlocBuilder<ThemeBloc, ThemeState>(builder: (context, themeState) {
      return GradientContainer(
        key: const Key('__Gradient_Container__'),
        color: themeState.themeEntity.materialColor,
        child: RefreshIndicator(
          key: const Key('__Refresh_Indicator__'),
          onRefresh: () {
            context.bloc<WeatherBloc>().add(
                  WeatherEvent.refreshWeatherForLocation(
                      state.weatherEntity.city),
                );
            return _refreshCompleter.future;
          },
          child: ListView(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.only(top: 100.0),
                child: Center(
                  child: Location(
                    key: const Key('__Location__'),
                    location: state.weatherEntity.weatherResponse
                        .getOrElse(() => null)
                        .title,
                  ),
                ),
              ),
              Center(
                child: LastUpdated(
                  key: const Key('__Last_Updated__'),
                  dateTime:
                      state.weatherEntity.lastUpdated.getOrElse(() => null),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 50.0),
                child: Center(
                  child: CombinedWeatherTemperature(
                      key: const Key('__Combined_Weather_Temperature__'),
                      weatherResponse: state.weatherEntity.weatherResponse
                          .getOrElse(() => null)),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildError() {
    return const Center(
      key: Key('__Error__'),
      child: Text(
        'Something went wrong!',
        style: TextStyle(color: Colors.red),
      ),
    );
  }

  Widget _buildLoading() {
    return const Center(
        child: CircularProgressIndicator(
      key: Key('__Circular_Progress_Indicator__'),
    ));
  }

  Widget _buildIdle() {
    return const Center(
        key: Key('__Idle__'), child: Text('Please Select a Location'));
  }
}
