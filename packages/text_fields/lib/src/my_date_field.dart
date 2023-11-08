import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';

import '../text_fields.dart';

class MyDateField extends StatefulWidget {
  final String? hintText;
  final DateTime? firstDate;
  final DateTime? value;
  final DateTime? lastDate;
  final ValueChanged<DateTime>? onChanged;

  const MyDateField(
      {super.key,
      this.firstDate,
      this.lastDate,
      this.hintText,
      this.onChanged,
      this.value});

  @override
  State<MyDateField> createState() => _MyDateFieldState();
}

class _MyDateFieldState extends State<MyDateField> {
  late TextEditingController _controller;
  @override
  void initState() {
    String text = '';
    if (widget.value != null) {
      text = MyDateFormat.formatDate(widget.value);
    }
    _controller = TextEditingController(text: text);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: _controller,
      onTap: () async {
        final initDate = DateTime.now();
        final date = await showDatePicker(
          context: context,
          initialDate: initDate,
          firstDate: widget.firstDate ?? initDate,
          lastDate:
              widget.lastDate ?? DateTime.now().add(const Duration(days: 365)),
        );
        if (date != null) {
          _controller.text = MyDateFormat.formatDate(date);
          widget.onChanged?.call(date);
        }
      },
      hintText: widget.hintText ?? 'Date',
      suffixIcon: const Icon(Icons.calendar_today),
      focusNode: AlwaysDisabledFocusNode(),
    );
  }
}
