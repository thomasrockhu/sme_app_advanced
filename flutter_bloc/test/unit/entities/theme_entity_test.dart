import 'package:flutter/material.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Theme Entity', () {
    test(
        'should check if the factory method ThemeEntity.initial() is creating the correct object',
        () {
      final ThemeEntity _initial = ThemeEntity.initial();
      expect(ThemeEntity.initial(), _initial);
    });
    test('should check if the factory constructor is working correctly', () {
      final ThemeData _tThemeData = ThemeData.dark();
      final MaterialColor _tMaterialColor = Colors.pink;
      final ThemeEntity _tThemeEntity =
          ThemeEntity(materialColor: _tMaterialColor, themeData: _tThemeData);
      final ThemeEntity _tThemeEntity2 =
          ThemeEntity(materialColor: _tMaterialColor, themeData: _tThemeData);
      expect(_tThemeEntity, _tThemeEntity2);
    });
  });
}
