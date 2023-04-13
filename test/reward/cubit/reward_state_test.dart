// // ignore_for_file: prefer_const_constructors

// import 'package:flutter_test/flutter_test.dart';
// import 'package:better_life_customer/reward/cubit/cubit.dart';

// void main() {
//   group('RewardState', () {
//     test('supports value equality', () {
//       expect(
//         RewardState(),
//         equals(
//           const RewardState(),
//         ),
//       );
//     });

//     group('constructor', () {
//       test('can be instantiated', () {
//         expect(
//           const RewardState(),
//           isNotNull,
//         );
//       });
//     });

//     group('copyWith', () {
//       test(
//         'copies correctly '
//         'when no argument specified',
//         () {
//           const rewardState = RewardState(
//             customProperty: 'My property',
//           );
//           expect(
//             rewardState.copyWith(),
//             equals(rewardState),
//           );
//         },
//       );

//       test(
//         'copies correctly '
//         'when all arguments specified',
//         () {
//           const rewardState = RewardState(
//             customProperty: 'My property',
//           );
//           final otherRewardState = RewardState(
//             customProperty: 'My property 2',
//           );
//           expect(rewardState, isNot(equals(otherRewardState)));

//           expect(
//             rewardState.copyWith(
//               customProperty: otherRewardState.customProperty,
//             ),
//             equals(otherRewardState),
//           );
//         },
//       );
//     });
//   });
// }
