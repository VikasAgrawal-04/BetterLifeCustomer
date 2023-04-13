// import 'package:api/api.dart';
// import 'package:flutter/material.dart';
// import 'package:better_life_customer/reward/cubit/cubit.dart';
// import 'package:widgets/widgets.dart';

// /// {@template reward_body}
// /// Body of the RewardPage.
// ///
// /// Add what it does
// /// {@endtemplate}
// class RewardBody extends StatelessWidget {
//   /// {@macro reward_body}
//   const RewardBody({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<RewardCubit, RewardState>(
//       builder: (context, state) {
//         return StatusHandler(
//           status: state.status,
//           onSuccess: ListView(
//             shrinkWrap: true,
//             children: [
//               _showRewards(
//                 state.data?.rewardsAllow ?? [],
//                 'Rewards Available',
//               ),
//               _showRewards(
//                 state.data?.rewardsMorePoints ?? [],
//                 'More Rewards Available',
//               ),
//             ],
//           ),
//         );
//         // return AnimatedSwitcher(
//         //   duration: kDuration,
//         //   child: _handleState(state),
//         // );
//       },
//     );
//   }

//   // Widget _handleState(RewardState state) {
//   //   late Widget child;
//   //   switch (state.status) {
//   //     case Status.initial:
//   //     case Status.loading:
//   //       child = const MyLoadingIndicator();
//   //       break;
//   //     case Status.empty:
//   //       child = const EmptyScreen(
//   //         message: 'No rewards found',
//   //       );
//   //       break;

//   //     case Status.success:
//   //       child = _showRewards(state.data?.rewardsAllow ?? []);
//   //       break;
//   //     case Status.error:
//   //       child = const EmptyScreen(
//   //         message: 'No rewards found',
//   //       );
//   //       break;
//   //   }
//   //   return child;
//   // }

//   ListView _showRewards(List<Rewards> rewards, String headline) {
//     return ListView(
//       physics: const NeverScrollableScrollPhysics(),
//       shrinkWrap: true,
//       children: [
//         const Gap(20),
//         Padding(
//           padding: const EdgeInsets.only(left: 12),
//           child: HeaderText(
//             text: headline,
//             fontSize: 24,
//           ),
//         ),
//         const Gap(20),
//         ListView.builder(
//           physics: const NeverScrollableScrollPhysics(),
//           shrinkWrap: true,
//           itemCount: rewards.length,
//           itemBuilder: (context, index) => RewardsTile(
//             rewards: rewards[index],
//           ),
//         ),
//       ],
//     );
//   }

//   TextStyle get _textStyle => const TextStyle(
//         fontSize: 20,
//         fontWeight: FontWeight.bold,
//       );
// }

// class RewardsTile extends StatelessWidget {
//   const RewardsTile({
//     required this.rewards,
//     super.key,
//   });
//   final Rewards rewards;

//   @override
//   Widget build(BuildContext context) {
//     // final image = context.read<ApiRepo>().imageUrl(rewards.mainimage!);
//     return DecoratedContainer(
//       margin: const EdgeInsets.all(10),
//       decoration: BoxDecoration(
//         borderRadius: kBorderRadius,
//         border: Border.all(color: Colors.grey.shade200),
//       ),
//       child: Row(
//         children: [
//           MyNetworkImage(
//             urlToImage: rewards.mainimage,
//             width: 100,
//             height: 100,
//           ),
//           const Gap(10),
//           Expanded(
//             child: AutoSpacing(
//               spacing: const Gap(5),
//               children: [
//                 HeaderText(
//                   text: rewards.title ?? '',
//                   fontSize: 18,
//                 ),
//                 Text(
//                   rewards.details ?? '',
//                   style: context.textTheme.bodyLarge?.copyWith(
//                     fontSize: 16,
//                     color: Colors.blue,
//                   ),
//                 ),
//                 Text(
//                   rewards.points.toString(),
//                   style: context.textTheme.bodyMedium?.copyWith(),
//                 ),
//               ],
//             ),
//           ),
//         ],
//       ),
//     );
//   }
// }
