import 'package:flutter_driver/src/driver/driver.dart';

import '../elements/location_search_test_element.dart';
import '../utils.dart';
import 'test_page.dart';

class LocationSearchTestPage extends TestPage {
  final _searchPageAppBarFinder =
      find.byValueKey("__Location_Search_App_Bar__");
  final _backButtonFinder = find.byTooltip('Back');
  LocationSearchTestPage(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) =>
      widgetExists(driver, _searchPageAppBarFinder);

  Future<void> tapBackButton() async {
    await driver.tap(_backButtonFinder);
  }

  LocationSearchTestElement get locationSearchTestElement =>
      LocationSearchTestElement(driver);
}
