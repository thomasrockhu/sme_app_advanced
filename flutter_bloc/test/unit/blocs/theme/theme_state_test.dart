import 'package:flutter_bloc_example/application/theme/theme_bloc.dart';
import 'package:flutter_bloc_example/domain/theme/theme_entity.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Theme State', () {
    group('ThemeState', () {
      test('toString returns correct value', () {
        final ThemeEntity themeEntity = ThemeEntity.initial();
        expect(ThemeState(themeEntity: themeEntity).toString(),
            'ThemeState(themeEntity: ${themeEntity.toString()})');
      });
    });
  });
}
