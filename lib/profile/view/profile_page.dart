import 'package:api/api.dart';
import 'package:better_life_customer/profile/cubit/cubit.dart';
import 'package:better_life_customer/profile/widgets/profile_body.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template profile_page}
/// A description for ProfilePage
/// {@endtemplate}
class ProfilePage extends StatelessWidget {
  /// {@macro profile_page}
  const ProfilePage({super.key});

  /// The static route for ProfilePage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const ProfilePage());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileCubit(context.read<ApiRepo>()),
      child: const ProfileView(),
    );
  }
}

/// {@template profile_view}
/// Displays the Body of ProfileView
/// {@endtemplate}
class ProfileView extends StatelessWidget {
  /// {@macro profile_view}
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('Profile'),
        backgroundColor: context.theme.primaryColor,
        leading: const SizedBox.shrink(),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: context.read<ProfileCubit>().logout,
          ),
          const Gap(20),
        ],
      ),
      body: const ProfileBody(),
    );
  }
}
