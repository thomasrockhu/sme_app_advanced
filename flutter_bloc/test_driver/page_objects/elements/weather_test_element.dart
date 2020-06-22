import 'package:flutter_driver/src/driver/driver.dart';

import '../utils.dart';
import 'test_element.dart';

class WeatherTestElement extends TestElement {
  final _weatherPageContentFinder = find.byValueKey('__Weather_Page_Content__');
  final _weatherPageContentIdleFinder = find.byValueKey('__Idle__');
  final _weatherPageContentLoadingFinder =
      find.byValueKey('__Circular_Progress_Indicator__');
  final _weatherPageContentErrorFinder = find.byValueKey('__Error__');
  final _gradientContainerFinder = find.byValueKey('__Gradient_Container__');
  final _refreshIndicatorFinder = find.byValueKey('__Refresh_Indicator__');
  final _locationFinder = find.byValueKey('__Location__');
  final _lastUpdatedFinder = find.byValueKey('__Last_Updated__');
  final _temperatureText = find.byValueKey('__Temperature_Text__');
  final _combinedWeatherTemperatureFinder =
      find.byValueKey('__Combined_Weather_Temperature__');
  WeatherTestElement(FlutterDriver driver) : super(driver);

  Future<bool> get isLoading {
    return driver.runUnsynchronized(() {
      return widgetExists(driver, _weatherPageContentLoadingFinder);
    });
  }

  Future<bool> get isIdle =>
      widgetExists(driver, _weatherPageContentIdleFinder);
  Future<bool> get isError =>
      widgetExists(driver, _weatherPageContentErrorFinder);
  Future<bool> get isLoaded => widgetExists(driver, _gradientContainerFinder);

  Future<void> dragToRefresh() async {
    await driver.scroll(
        _weatherPageContentFinder, 0, 50, const Duration(milliseconds: 100));
    return widgetExists(driver, _refreshIndicatorFinder);
  }

  Future<bool> get gradientContainer {
    return widgetExists(driver, _gradientContainerFinder);
  }

  Future<bool> get location {
    return widgetExists(driver, _locationFinder);
  }

  Future<bool> get lastUpdated {
    return widgetExists(driver, _lastUpdatedFinder);
  }

  Future<bool> get combinedWeatherTemperature {
    return widgetExists(driver, _combinedWeatherTemperatureFinder);
  }

  Future<String> get temperatureWidgetText async {
    print(await driver.getText(_temperatureText));
    return driver.getText(_temperatureText);
  }
}
