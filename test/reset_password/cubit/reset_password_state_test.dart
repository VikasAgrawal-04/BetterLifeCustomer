// // ignore_for_file: prefer_const_constructors

// import 'package:flutter/material.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:better_life_customer/reset_password/cubit/cubit.dart';

// void main() {
//   group('ResetPasswordState', () {
//     test('supports value equality', () {
//       expect(
//         ResetPasswordState.initial(),
//         equals(
//           ResetPasswordState.initial(),
//         ),
//       );
//     });

//     group('constructor', () {
//       test('can be instantiated', () {
//         expect(
//           ResetPasswordState(
//             confirmPassword: TextEditingController(),
//             password: TextEditingController(),
//           ),
//           isNotNull,
//         );
//       });
//     });

//     group('copyWith', () {
//       test(
//         'copies correctly '
//         'when no argument specified',
//         () {
//           final resetPasswordState = ResetPasswordState(
//             confirmPassword: TextEditingController(),
//             password: TextEditingController(),
//           );
//           expect(
//             resetPasswordState.copyWith(),
//             equals(resetPasswordState),
//           );
//         },
//       );

//       test(
//         'copies correctly '
//         'when all arguments specified',
//         () {
//           final resetPasswordState = ResetPasswordState(
//             confirmPassword: TextEditingController(),
//             password: TextEditingController(),
//           );
//           final otherResetPasswordState = ResetPasswordState(
//             confirmPassword: TextEditingController(text: 'test'),
//             password: TextEditingController(text: 'test'),
//           );
//           expect(resetPasswordState, isNot(equals(otherResetPasswordState)));

//           expect(
//             resetPasswordState.copyWith(
//               password: otherResetPasswordState.password,
//               confirmPassword: otherResetPasswordState.confirmPassword,
//             ),
//             equals(otherResetPasswordState),
//           );
//         },
//       );
//     });
//   });
// }
