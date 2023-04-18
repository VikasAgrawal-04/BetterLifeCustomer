import 'package:better_life_customer/home/cubit/cubit.dart';
import 'package:better_life_customer/home/widgets/home_tabbar.dart';
import 'package:better_life_customer/widgets/appointment_card/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:widgets/widgets.dart';

/// {@template home_body}
/// Body of the HomePage.
///
/// Add what it does
/// {@endtemplate}
class HomeBody extends StatelessWidget {
  /// {@macro home_body}
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        return Column(
          // fit: StackFit.expand,
          children: [
            Expanded(
              child: SingleChildScrollView(
                padding: kPadding,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeaderText(
                      text: '${state.tabs[state.currentIndex]} Appointments',
                    ),
                    const Gap(20),
                    StatusHandler(
                      status: state.status,
                      onSuccess: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        separatorBuilder: (context, index) => const Gap(20),
                        itemCount: state.appointments.length,
                        itemBuilder: (context, index) {
                          final appointment = state.appointments[index];
                          return AppointmentCard(
                            showRateService: state.currentIndex == 1,
                            isViewButttonVisible: state.currentIndex != 0,
                            appointment: state.appointments[index],
                            onPressed: () => context
                                .read<HomeCubit>()
                                .viewAppointment(state.appointments[index]),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            SizedBox(
              width: 1.sw,
              // bottom: 0,
              child: Container(
                padding: const EdgeInsets.only(bottom: 30),
                color: Colors.white,
                child: _buttonAndTabbar(state, context),
              ),
            ),
          ],
        );
      },
    );
  }

  Column _buttonAndTabbar(HomeState state, BuildContext context) {
    return Column(
      children: [
        MyElevatedButton(
          width: 0.9.sw,
          text: 'Create New Appointment',
          onPressed: context.read<HomeCubit>().onCreateAppointmentPressed,
        ),
        const Gap(10),
        HomeTabbar(
          currentIndex: state.currentIndex,
          tabs: state.tabs,
          onTap: (index) async {
            context.read<HomeCubit>().onTabTapped(index);
            await context.read<HomeCubit>().fetchUser();
          },
        ),
      ],
    );
  }

  // Container _currentBalance(BuildContext context) {
  //   return Container(
  //     width: 0.5.sw,
  //     alignment: Alignment.center,
  //     height: 50.sp,
  //     padding: const EdgeInsets.symmetric(
  //       horizontal: 20,
  //       vertical: 5,
  //     ),
  //     decoration: BoxDecoration(
  //       borderRadius: BorderRadius.circular(10),
  //       color: context.theme.primaryColor,
  //     ),
  //     child: BlocBuilder<HomeCubit, HomeState>(
  //       builder: (context, state) {
  //         return Text(
  //           (state.user?.balancePoints ?? 0).toString(),
  //           style: context.textTheme.headlineSmall?.copyWith(
  //             color: Colors.white,
  //             fontWeight: FontWeight.bold,
  //             fontSize: 26.sp,
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }

//   Widget _buildTabbar() {
//     final tabs = [
//       'Todays',
//       'Upcoming',
//       'Past',
//     ];

//     return Container(
//       decoration: const BoxDecoration(borderRadius: kBorderRadius),
//       child: Row(
//         // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: tabs
//             .map(
//               (e) => AnimatedContainer(
//                 duration: const Duration(milliseconds: 300),
//                 padding:
//                     const EdgeInsets.symmetric(horizontal: 37, vertical: 12),
//                 decoration: const BoxDecoration(
//                   color: Color(0xffF4F4F6),
//                 ),
//                 child: Text(
//                   e,
//                   style: const TextStyle(),
//                 ),
//               ),
//             )
//             .toList(),
//       ),
//     );
//   }
// }
}

class MemberShipId extends StatelessWidget {
  const MemberShipId({super.key, required this.data});
  final String data;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Your membership Id'.toUpperCase(),
          style: context.textTheme.titleLarge?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        ),
        const Gap(10),
        Container(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
            vertical: 5,
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            // color: context.theme.primaryColor,
            color: Colors.white,
          ),
          child: QrImage(
            data: data,
          ),
        ),
        Text(
          data,
          style: context.textTheme.headlineMedium?.copyWith(
            fontWeight: FontWeight.bold,
            color: Colors.black87,
          ),
        )
      ],
    );
  }
}
