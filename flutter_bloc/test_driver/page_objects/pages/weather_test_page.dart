import 'package:flutter_driver/src/driver/driver.dart';

import '../elements/weather_test_element.dart';
import '../utils.dart';
import 'location_search_test_page.dart';
import 'settings_test_page.dart';
import 'test_page.dart';

class WeatherTestPage extends TestPage {
  final _weatherPageAppBarFinder = find.byValueKey('__Weather_App_Bar__');
  final _searchFabFinder = find.byValueKey('__Search_FAB__');
  final _settingsIconButtonFinder = find.byValueKey('__Settings_IconButton__');

  WeatherTestPage(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) async {
    return widgetExists(driver, _weatherPageAppBarFinder);
  }

  Future<LocationSearchTestPage> tapSearchFabButton() async {
    await driver.tap(_searchFabFinder);
    return LocationSearchTestPage(driver);
  }

  Future<SettingsTestPage> tapSettingsIconButton() async {
    await driver.tap(_settingsIconButtonFinder);
    return SettingsTestPage(driver);
  }

  WeatherTestElement get weatherTestElement {
    return WeatherTestElement(driver);
  }
}
