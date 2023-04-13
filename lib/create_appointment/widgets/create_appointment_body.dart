import 'package:better_life_customer/create_appointment/cubit/cubit.dart';
import 'package:better_life_customer/create_appointment/widgets/appointment_step_1.dart';
import 'package:better_life_customer/create_appointment/widgets/appointment_step_2.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

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
                  children: [const AppointmentStep1(), const AppointmentStep2()]
                      .map((e) => SingleChildScrollView(child: e))
                      .toList(),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
