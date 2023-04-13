// import 'package:api/api.dart';
// import 'package:flutter/material.dart';
// import 'package:better_life_customer/reward/cubit/cubit.dart';
// import 'package:better_life_customer/reward/widgets/available_coins.dart';
// import 'package:better_life_customer/reward/widgets/reward_body.dart';
// import 'package:widgets/widgets.dart';

// /// {@template reward_page}
// /// A description for RewardPage
// /// {@endtemplate}
// class RewardPage extends StatelessWidget {
//   /// {@macro reward_page}
//   const RewardPage({super.key});

//   /// The static route for RewardPage
//   static Route<dynamic> route() {
//     return MaterialPageRoute<dynamic>(builder: (_) => const RewardPage());
//   }

//   @override
//   Widget build(BuildContext context) {
//     return BlocProvider(
//       create: (context) => RewardCubit(context.read<ApiRepo>()),
//       child: const RewardView(),
//     );
//   }
// }

// /// {@template reward_view}
// /// Displays the Body of RewardView
// /// {@endtemplate}
// class RewardView extends StatelessWidget {
//   /// {@macro reward_view}
//   const RewardView({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: MyAppBar(
//         title: const Text('Reward'),
//         leading: const SizedBox.shrink(),
//         backgroundColor: context.theme.primaryColor,
//         actions: const [AvailableCoins(), Gap(20)],
//       ),
//       body: const RewardBody(),
//     );
//   }
// }
