// ignore_for_file: prefer_const_constructors

import 'package:better_life_customer/splash/cubit/cubit.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('SplashState', () {
    test('supports value equality', () {
      expect(
        SplashState(),
        equals(
          const SplashState(),
        ),
      );
    });

    group('constructor', () {
      test('can be instantiated', () {
        expect(
          const SplashState(),
          isNotNull,
        );
      });
    });

    group('copyWith', () {
      test(
        'copies correctly '
        'when no argument specified',
        () {
          const splashState = SplashState(
            customProperty: 'My property',
          );
          expect(
            splashState.copyWith(),
            equals(splashState),
          );
        },
      );

      test(
        'copies correctly '
        'when all arguments specified',
        () {
          const splashState = SplashState(
            customProperty: 'My property',
          );
          final otherSplashState = SplashState(
            customProperty: 'My property 2',
          );
          expect(splashState, isNot(equals(otherSplashState)));

          expect(
            splashState.copyWith(
              customProperty: otherSplashState.customProperty,
            ),
            equals(otherSplashState),
          );
        },
      );
    });
  });
}
