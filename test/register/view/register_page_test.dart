// ignore_for_file: prefer_const_constructors

import 'package:better_life_customer/register/register.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('RegisterPage', () {
    group('route', () {
      test('is routable', () {
        expect(RegisterPage.route(), isA<MaterialPageRoute>());
      });
    });

    testWidgets('renders RegisterView', (tester) async {
      await tester.pumpWidget(MaterialApp(home: RegisterPage()));
      expect(find.byType(RegisterView), findsOneWidget);
    });
  });
}
