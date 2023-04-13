import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class RescheduleAppointment extends StatefulWidget {
  const RescheduleAppointment({
    super.key,
    required this.onReschedule,
    required this.id,
  });
  final int id;
  final Future<void> Function(RescheduleAppointmentParams) onReschedule;

  @override
  _RescheduleAppointmentState createState() => _RescheduleAppointmentState();
}

class _RescheduleAppointmentState extends State<RescheduleAppointment> {
  DateTime? _selectedDate;
  DateTime? _selectedTime;
  final formKey = GlobalKey<FormState>();
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

                if (_selectedDate != null && _selectedTime != null) {
                  await widget.onReschedule(
                    RescheduleAppointmentParams(
                      appointmentId: widget.id,
                      appointmentDate: _selectedDate!,
                      appointmentTime: _selectedTime!,
                    ),
                  );
                }
              } catch (e) {}
            },
          ),
        ],
      ),
    );
  }
}
