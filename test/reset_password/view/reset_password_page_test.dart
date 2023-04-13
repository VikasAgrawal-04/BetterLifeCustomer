// ignore_for_file: prefer_const_constructors

import 'package:better_life_customer/reset_password/reset_password.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('ResetPasswordPage', () {
    group('route', () {
      test('is routable', () {
        expect(ResetPasswordPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders ResetPasswordView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: ResetPasswordPage()));
      expect(find.byType(ResetPasswordView), findsOneWidget);
    });
  });
}
