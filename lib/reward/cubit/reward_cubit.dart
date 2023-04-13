// import 'dart:async';

// import 'package:api/api.dart';
// import 'package:bloc/bloc.dart';
// import 'package:equatable/equatable.dart';
// import 'package:better_life_customer/services/dialog_service.dart';
// import 'package:widgets/widgets/status_handler.dart';

// part 'reward_state.dart';

// class RewardCubit extends Cubit<RewardState> {
//   RewardCubit(this.api) : super(const RewardState()) {
//     getRewards();
//   }

//   final ApiRepo api;

//   /// A description for yourCustomFunction
//   FutureOr<void> getRewards() async {
//     final user = api.getUser();
//     emit(state.copyWith(status: Status.loading));
//     final result =
//         await api.getTodayAppointments(id: user!.customerId.toString());
//     result.when(
//       success: (data) {
//         emit(
//           state.copyWith(
//             data: data,
//             status: (data.rewardsAllow?.isEmpty ?? false)
//                 ? Status.empty
//                 : Status.success,
//           ),
//         );
//       },
//       failure: (error) {
//         DialogService.failure(error);
//         emit(state.copyWith(status: Status.error));
//       },
//     );
//   }
// }
