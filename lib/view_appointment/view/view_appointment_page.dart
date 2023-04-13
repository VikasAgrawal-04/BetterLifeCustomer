// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/api.dart';
import 'package:better_life_customer/view_appointment/cubit/cubit.dart';
import 'package:better_life_customer/view_appointment/widgets/view_appointment_body.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

/// {@template view_appointment_page}
/// A description for ViewAppointmentPage
/// {@endtemplate}
class ViewAppointmentPage extends StatelessWidget {
  /// {@macro view_appointment_page}
  const ViewAppointmentPage({
    required this.appointment,
    required this.type,
    super.key,
  });

  final Appointment appointment;
  final AppointmentType type;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ViewAppointmentCubit(
        appointment,
        context.read<ApiRepo>(),
        type,
      ),
      child: const Scaffold(
        appBar: MyAppBar(
          title: Text('View Appointment'),
        ),
        body: ViewAppointmentView(),
      ),
    );
  }
}

/// {@template view_appointment_view}
/// Displays the Body of ViewAppointmentView
/// {@endtemplate}
class ViewAppointmentView extends StatelessWidget {
  /// {@macro view_appointment_view}
  const ViewAppointmentView({super.key});

  @override
  Widget build(BuildContext context) {
    return const ViewAppointmentBody();
  }
}
