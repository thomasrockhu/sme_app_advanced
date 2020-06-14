import 'package:injectable/injectable.dart';
import 'package:weather_repository_core/weather_repository_core.dart';

@module
abstract class WeatherRepositoryInjectableModule {
  @lazySingleton
  WeatherRepository get weatherRepository => WeatherRepository();
}
