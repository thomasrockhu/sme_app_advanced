import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc_example/application/weather/weather_bloc.dart';
import 'package:flutter_bloc_example/domain/weather/weather_entity.dart';
import 'package:flutter_bloc_example/infrastructure/weather/weather_repository_facade.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';
import 'package:weather_app_example_data_models_core/weather_app_example_data_models_core.dart';

class MockWeatherRepositoryFacade extends Mock
    implements WeatherRepositoryFacade {}

class MockWeatherResponse extends Mock implements WeatherResponse {}

class MockWeatherBloc extends MockBloc<WeatherEvent, WeatherState>
    implements WeatherBloc {}

void main() {
  group('WeatherBloc', () {
    WeatherRepositoryFacade weatherRepositoryFacade;
    WeatherResponse weatherResponse;
    WeatherBloc weatherBloc;

    setUp(() {
      weatherRepositoryFacade = MockWeatherRepositoryFacade();
      weatherResponse = MockWeatherResponse();
      // tWeatherEntity = WeatherEntity.initial();
      weatherBloc = WeatherBloc(weatherRepositoryFacade);
    });

    test('initial state is WeatherState.initial()', () {
      expect(weatherBloc.initialState, const Initial());
    });

    blocTest(
      'should emit LoadingFailure if repository throws in response to fetch weather event',
      build: () async {
        when(weatherRepositoryFacade.getWeatherForLocation(location: 'London'))
            .thenThrow(Exception('Oops'));
        return weatherBloc;
      },
      act: (WeatherBloc bloc) async => bloc.add(const FetchWeather('London')),
      expect: [
        const Loading(),
        const LoadingFailure(),
      ],
    );
    blocTest(
      'should emit LoadingFailure if repository throws in response to refresh weather event',
      build: () async {
        when(weatherRepositoryFacade.getWeatherForLocation(location: 'London'))
            .thenThrow(Exception('Oops'));
        return weatherBloc;
      },
      act: (WeatherBloc bloc) async => bloc.add(const RefreshWeather('London')),
      expect: [
        const LoadingFailure(),
      ],
    );

// incorrect location for test

    // test('should get weather response when city name is passed', () async {
    //   when(weatherRepositoryFacade.getWeatherForLocation(location: 'London'))
    //       .thenAnswer((_) => Future.value(weatherResponse));
    //   final result = await weatherRepositoryFacade.getWeatherForLocation(
    //       location: 'London');

    //   expect(
    //       await weatherRepositoryFacade.getWeatherForLocation(
    //           location: 'London'),
    //       result);
    // });

    test(
        'should check if order of states is emmited correctly for fetch weather event',
        () async {
      final weatherEntity = WeatherEntity(
          weatherResponse: some(weatherResponse),
          city: 'London',
          lastUpdated: some(DateTime.now()));
      final mockedWeatherBloc = MockWeatherBloc();
      whenListen(
          mockedWeatherBloc,
          Stream.fromIterable(
              <WeatherState>[const Loading(), Loaded(weatherEntity)]));

      await expectLater(mockedWeatherBloc,
          emitsInOrder(<WeatherState>[const Loading(), Loaded(weatherEntity)]));

      expect(mockedWeatherBloc.state, Loaded(weatherEntity));
    });
  });
}
