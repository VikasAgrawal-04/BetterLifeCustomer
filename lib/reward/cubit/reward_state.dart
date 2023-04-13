// // ignore_for_file: public_member_api_docs, sort_constructors_first

// part of 'reward_cubit.dart';

// /// {@template reward}
// /// RewardState description
// /// {@endtemplate}
// class RewardState extends Equatable {
//   /// {@macro reward}
//   const RewardState({
//     this.data,
//     this.status = Status.initial,
//   });

//   final RewardsResponseModel? data;
//   final Status status;

//   /// A description for customProperty

//   @override
//   List<Object?> get props => [data, status];

//   /// Creates a copy of the current RewardState with property changes

//   RewardState copyWith({
//     RewardsResponseModel? data,
//     Status? status,
//   }) {
//     return RewardState(
//       data: data ?? this.data,
//       status: status ?? this.status,
//     );
//   }
// }

// /// {@template reward_initial}
// /// The initial state of RewardState
// /// {@endtemplate}
// class RewardInitial extends RewardState {
//   /// {@macro reward_initial}
//   const RewardInitial() : super();
// }

// class RewardLoading extends RewardState {
//   /// {@macro reward_initial}
//   const RewardLoading() : super();
// }

// class RewardLoaded extends RewardState {
//   /// {@macro reward_initial}

//   const RewardLoaded({required this.data}) : super();

//   @override
//   final RewardsResponseModel data;
// }

// class RewardError extends RewardState {
//   const RewardError(this.error) : super();

//   /// {@macro reward_initial}
//   final String error;
// }
