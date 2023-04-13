import 'package:better_life_customer/profile/cubit/cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

/// {@template profile_body}
/// Body of the ProfilePage.
///
/// Add what it does
/// {@endtemplate}
class ProfileBody extends StatelessWidget {
  /// {@macro profile_body}
  const ProfileBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ProfileCubit, ProfileState>(
      builder: (context, state) {
        return ListView(
          padding: kPadding,
          children: [
            const Gap(20),
            MyTextField(
              hintText: 'Full Name',
              controller: state.name,
            ),
            const Gap(15),

            // MyTextField(
            //   hintText: 'Mobile',
            //   controller: state.phone,
            // ),
            // const Gap(15),

            EmailField(
              controller: state.email,
            ),

            Row(
              children: [
                const Spacer(),
                MyTextButton(
                  text: 'Reset Password',
                  onPressed: context.read<ProfileCubit>().goToResetPassword,
                ),
              ],
            ),

            MyElevatedButton(
              text: 'Update Profile',
              onPressed: context.read<ProfileCubit>().updateProfile,
            ),
            // const Spacer(),
            Gap(.23.sh),
          ],
        );
      },
    );
  }
}
