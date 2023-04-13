import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:better_life_customer/bottom_nav/view/bottom_nav_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class BottomNavPage extends StatelessWidget {
  const BottomNavPage({super.key});

  @override
  Widget build(BuildContext context) {
    // return const BottomNavView();
    return BlocProvider<BottomNavCubit>(
      create: (_) => BottomNavCubit(),
      child: const BottomNavView(),
    );
  }
}
