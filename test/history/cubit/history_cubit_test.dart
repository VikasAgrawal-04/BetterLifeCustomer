// // ignore_for_file: prefer_const_constructors

// import 'package:bloc_test/bloc_test.dart';
// import 'package:flutter_test/flutter_test.dart';
// import 'package:better_life_customer/history/cubit/cubit.dart';

// void main() {
//   group('HistoryCubit', () {
//     group('constructor', () {
//       test('can be instantiated', () {
//         expect(
//           HistoryCubit(),
//           isNotNull,
//         );
//       });
//     });

//     test('initial state has default value for customProperty', () {
//       final historyCubit = HistoryCubit();
//       expect(historyCubit.state.customProperty, equals('Default Value'));
//     });

//     blocTest<HistoryCubit, HistoryState>(
//       'yourCustomFunction emits nothing',
//       build: HistoryCubit.new,
//       act: (cubit) => cubit.yourCustomFunction(),
//       expect: () => <HistoryState>[],
//     );
//   });
// }
