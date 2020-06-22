import 'package:flutter_driver/src/driver/driver.dart';

import '../elements/settings_test_element.dart';
import '../utils.dart';
import 'test_page.dart';

class SettingsTestPage extends TestPage {
  final _settingsPageAppBarFinder = find.byValueKey("__Settings_App_Bar__");
  final _backButtonFinder = find.byTooltip('Back');
  SettingsTestPage(FlutterDriver driver) : super(driver);

  @override
  Future<bool> isReady({Duration timeout}) =>
      widgetExists(driver, _settingsPageAppBarFinder);

  Future<void> tapBackButton() async {
    await driver.tap(_backButtonFinder);
  }

  SettingsTestElement get settingsTestElement {
    return SettingsTestElement(driver);
  }
}
