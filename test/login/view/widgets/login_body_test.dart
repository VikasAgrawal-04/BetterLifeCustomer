// ignore_for_file: prefer_const_constructors

import 'package:api/api.dart';
import 'package:better_life_customer/login/login.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('LoginBody', () {
    testWidgets('renders Text', (tester) async {
      await tester.pumpWidget(
        BlocProvider(
          create: (context) => LoginCubit(context.read<ApiRepo>()),
          child: MaterialApp(home: LoginBody()),
        ),
      );

      expect(find.byType(Text), findsOneWidget);
    });
  });
}
