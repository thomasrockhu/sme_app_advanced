import 'package:flutter_driver/src/driver/driver.dart';

import 'test_element.dart';

class LocationSearchTestElement extends TestElement {
  final _locationInputFinder =
      find.byValueKey('__Location_Search_Text_Form_Field__');
  final _searchIconButtonFinder =
      find.byValueKey('__Location_Search_Icon_Button__');

  LocationSearchTestElement(FlutterDriver driver) : super(driver);

  Future<void> enterLocation(String location) async {
    await driver.tap(_locationInputFinder);
    await driver.enterText(location);
    await driver.waitFor(find.text(location));
  }

  Future<void> tapSearchIconButton() async {
    await driver.tap(_searchIconButtonFinder);
  }
}
