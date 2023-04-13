// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:text_fields/src/text_formatters/input_formatters.dart';
import 'package:validators/validators.dart';

import 'my_text_field.dart';

class EmailField extends StatelessWidget {
  final TextEditingController? controller;
  final FocusNode? focusNode;

  final String? label, initialValue;
  final void Function(String)? onChanged, onSubmitted;
  final InputDecoration? inputDecoration;
  final bool readOnly;
  final bool hidePrefixIcon;
  const EmailField({
    super.key,
    this.hidePrefixIcon = true,
    this.controller,
    this.onChanged,
    this.focusNode,
    this.label,
    this.onSubmitted,
    this.inputDecoration,
    this.readOnly = false,
    this.initialValue,
  });

  @override
  Widget build(BuildContext context) {
    // final iconColor = Theme.of(context).iconTheme.color;
    return MyTextField(
      // textCapitalization: TextCapitalization.,
      initialValue: initialValue,
      inputFormatters: [LowerCaseTextFormatter()],
      focusNode: focusNode,
      controller: controller,
      hintText: label ?? 'Email ID',
      readOnly: readOnly,
      decoration: inputDecoration,
      onChanged: onChanged,
      validator: Validator.email,
      textInputAction: TextInputAction.next,
      textInputType: TextInputType.emailAddress,
      prefixIcon: hidePrefixIcon ? null : const Icon(Icons.email_outlined),
    );
  }
}
