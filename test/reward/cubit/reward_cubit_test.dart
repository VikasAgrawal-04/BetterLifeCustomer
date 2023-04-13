// // ignore_for_file: prefer_const_constructors

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:better_life_customer/reward/cubit/cubit.dart';

// void main() {
//   group('RewardCubit', () {
//     group('constructor', () {
//       test('can be instantiated', () {
//         expect(
//           RewardCubit(),
//           isNotNull,
//         );
//       });
//     });

//     test('initial state has default value for customProperty', () {
//       final rewardCubit = RewardCubit();
//       expect(rewardCubit.state.customProperty, equals('Default Value'));
//     });

//     blocTest<RewardCubit, RewardState>(
//       'yourCustomFunction emits nothing',
//       build: RewardCubit.new,
//       act: (cubit) => cubit.getRewards(),
//       expect: () => <RewardState>[],
//     );
//   });
// }
