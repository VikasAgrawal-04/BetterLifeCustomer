import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../text_fields.dart';

class MyTimeField extends StatefulWidget {
  final String label;
  final ValueChanged<DateTime>? onChanged;

  final DateTime? time;

  const MyTimeField({
    super.key,
    this.onChanged,
    required this.label,
    this.time,
  });

  @override
  State<MyTimeField> createState() => _MyTimeFieldState();
}

class _MyTimeFieldState extends State<MyTimeField> {
  final controller = TextEditingController();
  DateTime? pickedDateTime;

  @override
  void initState() {
    if (widget.time != null) {
      controller.text = formatDate(widget.time!);
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      focusNode: AlwaysDisabledFocusNode(),
      // enabled: false,
      onTap: _timePicker,
      suffixIcon: const Icon(Icons.timer_outlined),
      hintText: widget.label,
      textInputType: TextInputType.datetime,
      controller: controller,
      // validator: (s) => Validator.(pickedDateTime),
    );
  }

  Future<void> _timePicker() async {
    final pickedTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );
    if (pickedTime != null) {
      final currentDate = DateTime.now();
      pickedDateTime = DateTime(
        currentDate.year,
        currentDate.month,
        currentDate.day,
        pickedTime.hour,
        pickedTime.minute,
      );
      controller.text = formatDate(pickedDateTime!);
      widget.onChanged!(pickedDateTime!);
    }
  }

  // create a function to format date
  String formatDate(DateTime date) => MyDateFormat.formatTime(date);
}
