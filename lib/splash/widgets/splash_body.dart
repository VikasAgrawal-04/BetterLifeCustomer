import 'package:better_life_customer/splash/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:widgets/widgets.dart';

/// {@template splash_body}
/// Body of the SplashPage.
///
/// Add what it does
/// {@endtemplate}
class SplashBody extends StatelessWidget {
  /// {@macro splash_body}
  const SplashBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<SplashCubit, SplashState>(
      builder: (context, state) {
        return Stack(
          alignment: Alignment.center,
          children: [
            Padding(
              padding: kPadding,
              child: Center(
                child: SvgPicture.asset(
                  'assets/logo_svg.svg',
                ),
              ),
            ),
            Positioned(
              bottom: state.isLoggedIn ? -100 : 50,
              child: MyElevatedButton(
                width: 0.9.sw,
                text: 'Get Started',
                onPressed: context.read<SplashCubit>().getStarted,
              ),
            ),
          ],
        );
      },
    );
  }
}
