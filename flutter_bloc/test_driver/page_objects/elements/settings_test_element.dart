import 'package:flutter_driver/src/driver/driver.dart';

import 'test_element.dart';

class SettingsTestElement extends TestElement {
  final _settingsSwitchFinder = find.byValueKey('__Settings_Switch__');

  SettingsTestElement(FlutterDriver driver) : super(driver);

  Future<void> tapTemperatureUnitSwitch() async {
    await driver.tap(_settingsSwitchFinder);
  }
}
