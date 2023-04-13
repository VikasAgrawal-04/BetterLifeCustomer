import 'package:api/api.dart';
import 'package:better_life_customer/create_appointment/cubit/cubit.dart';
import 'package:better_life_customer/create_appointment/widgets/create_appointment_body.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets/widgets.dart';

/// {@template create_appointment_page}
/// A description for CreateAppointmentPage
/// {@endtemplate}
class CreateAppointmentPage extends StatelessWidget {
  /// {@macro create_appointment_page}
  const CreateAppointmentPage({super.key});

  /// The static route for CreateAppointmentPage
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
      builder: (_) => const CreateAppointmentPage(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CreateAppointmentCubit(context.read<ApiRepo>()),
      child: const Scaffold(
        appBar: MyAppBar(
          showDivider: false,
        ),
        body: CreateAppointmentView(),
      ),
    );
  }
}

/// {@template create_appointment_view}
/// Displays the Body of CreateAppointmentView
/// {@endtemplate}
class CreateAppointmentView extends StatelessWidget {
  /// {@macro create_appointment_view}
  const CreateAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const CreateAppointmentBody();
  }
}
