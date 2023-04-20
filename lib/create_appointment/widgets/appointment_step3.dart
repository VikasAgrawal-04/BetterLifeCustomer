import 'package:better_life_customer/create_appointment/cubit/create_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppointmentStep3 extends StatelessWidget {
  const AppointmentStep3({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
      builder: (context, state) {
        return Column(
          children: const [],
        );
      },
    );
  }
}
