// // ignore_for_file: prefer_const_constructors

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:better_life_customer/reset_password/cubit/cubit.dart';

// void main() {
//   group('ResetPasswordCubit', () {
//     group('constructor', () {
//       test('can be instantiated', () {
//         expect(
//           ResetPasswordCubit(),
//           isNotNull,
//         );
//       });
//     });

//     test('initial state has default value for customProperty', () {
//       final resetPasswordCubit = ResetPasswordCubit();
//       expect(resetPasswordCubit.state, ResetPasswordState.initial());
//     });

//     blocTest<ResetPasswordCubit, ResetPasswordState>(
//       'yourCustomFunction emits nothing',
//       build: ResetPasswordCubit.new,
//       act: (cubit) => cubit.resetPassword(),
//       expect: () => <ResetPasswordState>[],
//     );
//   });
// }
