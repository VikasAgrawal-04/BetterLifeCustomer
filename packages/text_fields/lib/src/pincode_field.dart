// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_fields/src/my_text_field.dart';
import 'package:validators/validators.dart';

class PincodeField extends StatelessWidget {
  final TextEditingController? controller;
  final ValueChanged<String>? onChanged;
  final String? hintText;
  const PincodeField({
    Key? key,
    this.controller,
    this.onChanged,
    this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      hintText: hintText ?? 'Pincode',
      controller: controller,
      onChanged: onChanged,
      textInputType: TextInputType.number,
      textInputAction: TextInputAction.next,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
      ],
      maxLength: 6,
      validator: Validator.pinCode,
    );
  }
}
