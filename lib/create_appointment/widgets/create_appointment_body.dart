import 'package:better_life_customer/create_appointment/cubit/cubit.dart';
import 'package:better_life_customer/create_appointment/widgets/appointment_step3.dart';
import 'package:better_life_customer/create_appointment/widgets/appointment_step_1.dart';
import 'package:better_life_customer/create_appointment/widgets/appointment_step_2.dart';
import 'package:better_life_customer/select_previous_caretaker/view/select_previous_caretaker_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';
import 'package:widgets/widgets/my_loading_indicator.dart';

/// {@template create_appointment_body}
/// Body of the CreateAppointmentPage.
///
/// Add what it does
/// {@endtemplate}
class CreateAppointmentBody extends StatelessWidget {
  /// {@macro create_appointment_body}
  const CreateAppointmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<CreateAppointmentCubit>();
        return Form(
          key: state.formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: HeaderText(
                  text: 'Create New Appointment',
                  fontSize: 26,
                  style: TextStyle(letterSpacing: 0.5),
                ),
              ),
              const Gap(20),
              Expanded(
                child: PageView(
                  physics: const NeverScrollableScrollPhysics(),
                  controller: state.pageController,
                  children: [
                    if (state.previousCaretakersLoading)
                      SizedBox.square(
                        dimension: 1.sh * 0.4,
                        child: const MyLoadingIndicator(),
                      )
                    else
                      SelectPreviousCaretakerPage(
                        caretakers: state.previousCaretakers,
                        onProceed: cubit.onPreviousCaretakerSelected,
                        onSkip: () => cubit.changeStep(state.step + 1),
                      ),
                    const AppointmentStep1(),
                    const AppointmentStep2(),
                    const AppointmentStep3(),
                  ].map((e) => SingleChildScrollView(child: e)).toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
