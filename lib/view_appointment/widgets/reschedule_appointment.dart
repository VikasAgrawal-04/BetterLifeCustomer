import 'package:api/api.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class RescheduleAppointment extends StatefulWidget {
  const RescheduleAppointment({
    required this.onReschedule,
    required this.id,
    required this.appt,
    super.key,
  });
  final int id;
  final Appointment appt;
  final Future<void> Function(RescheduleAppointmentParams) onReschedule;

  @override
  _RescheduleAppointmentState createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
  DateTime parseVisitDate(String visitDate) {
    final date = visitDate.split('(')[0];
    return DateFormat('d MMM yyyy').parse(date);
  }

  DateTime parsePickupTime(String pickupTime) {
    return DateFormat('hh:mm a').parse(pickupTime);
  }

  late DateTime _selectedDate;

  late DateTime _selectedTime;
  final formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _selectedDate = parseVisitDate(widget.appt.visitdate.toString());
      _selectedTime = parsePickupTime(widget.appt.pickuptime.toString());
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: formKey,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(
            text: 'Reschedule Appointment',
            fontSize: 20,
          ),
          const Gap(20),
          MyDateField(
            hintText: 'Appointment Date',
            onChanged: (value) {
              setState(() {
                _selectedDate = value;
              });
            },
            value: _selectedDate,
          ),
          MyTimeField(
            label: 'Appointment Time',
            onChanged: (value) {
              setState(() {
                _selectedTime = value;
              });
            },
            time: _selectedTime,
          ),
          const Gap(20),
          MyElevatedButton(
            text: 'Reschedule',
            color: Colors.green,
            height: 38,
            onPressed: () async {
              try {
                if (!formKey.currentState!.validate()) {
                  return;
                }

                final date = _selectedDate.add(
                  Duration(
                    hours: _selectedTime.hour,
                    minutes: _selectedTime.minute,
                  ),
                );
                await widget.onReschedule(
                  RescheduleAppointmentParams(
                    appointmentId: widget.id,
                    appointmentDate: date,
                  ),
                );
              } catch (e) {
                print(e);
              }
            },
          ),
        ],
      ),
    );
  }
}
