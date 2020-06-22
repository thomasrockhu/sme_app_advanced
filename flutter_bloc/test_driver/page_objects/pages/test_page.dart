import 'dart:async';

import 'package:flutter_driver/flutter_driver.dart';

abstract class TestPage {
  final FlutterDriver driver;

  TestPage(this.driver);

  Future<bool> isLoading({Duration timeout}) async {
    return !(await isReady(timeout: timeout));
  }

  Future<bool> isReady({Duration timeout});
}
