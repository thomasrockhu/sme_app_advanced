import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

import 'page_objects/page_objects.dart';

void main() {
  group('Weather App', () {
    FlutterDriver driver;
    WeatherTestPage weatherTestPage;

    setUp(() async {
      driver = await FlutterDriver.connect();
      weatherTestPage = WeatherTestPage(driver);
    });

    tearDownAll(() async {
      if (driver != null) {
        driver.close();
      }
    });

    test('starts with initial page', () async {
      expect(await weatherTestPage.isReady(), isTrue);
    });
    test(
        'should be able to tap on search floating action button to navigate to location search page',
        () async {
      expect(await weatherTestPage.isReady(), isTrue);
      final LocationSearchTestPage locationSearchTestPage =
          await weatherTestPage.tapSearchFabButton();
      expect(await locationSearchTestPage.isReady(), isTrue);
      await locationSearchTestPage.tapBackButton();
    });
    test(
        'should be able to tap on settings icon button to navigate to settings page',
        () async {
      expect(await weatherTestPage.isReady(), isTrue);
      final SettingsTestPage settingsTestPage =
          await weatherTestPage.tapSettingsIconButton();
      expect(await settingsTestPage.isReady(), isTrue);
      await settingsTestPage.tapBackButton();
    });

    test('should be able to search for weather data for a given location',
        () async {
      expect(await weatherTestPage.isReady(), isTrue);
      final LocationSearchTestPage locationSearchTestPage =
          await weatherTestPage.tapSearchFabButton();
      expect(await locationSearchTestPage.isReady(), isTrue);
      await locationSearchTestPage.locationSearchTestElement
          .enterLocation('London');
      await locationSearchTestPage.locationSearchTestElement
          .tapSearchIconButton();
      expect(await weatherTestPage.isReady(), isTrue);
      final weatherTestElement = weatherTestPage.weatherTestElement;
      expect(await weatherTestElement.isLoaded, isTrue);
      expect(await weatherTestElement.gradientContainer, isTrue);
      expect(await weatherTestElement.location, isTrue);
      expect(await weatherTestElement.lastUpdated, isTrue);
      expect(await weatherTestElement.combinedWeatherTemperature, isTrue);
    });

    test('should be able to switch from celcius to fahrenheit', () async {
      expect(await weatherTestPage.isReady(), isTrue);
      final weatherTestElement = weatherTestPage.weatherTestElement;
      String temperatureWidgetText =
          await weatherTestElement.temperatureWidgetText;
      expect(temperatureWidgetText.contains('°C'), isTrue);
      final SettingsTestPage settingsTestPage =
          await weatherTestPage.tapSettingsIconButton();
      expect(await settingsTestPage.isReady(), isTrue);
      final settingsTestElement = settingsTestPage.settingsTestElement;
      await settingsTestElement.tapTemperatureUnitSwitch();
      await settingsTestPage.tapBackButton();
      temperatureWidgetText = await weatherTestElement.temperatureWidgetText;
      expect(temperatureWidgetText.contains('°F'), isTrue);
    });
  });
}
