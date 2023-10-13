// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_fields/text_fields.dart';
import 'package:validators/validators.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool hidePrefixIcon;
  final String? Function(String?)? validator;
  final TextInputAction textInputAction;
  const PhoneTextField(
      {Key? key,
      this.controller,
      this.hintText,
      this.hidePrefixIcon = true,
      this.validator,
      this.textInputAction = TextInputAction.next})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      textInputType: TextInputType.phone,
      textInputAction: textInputAction,
      maxLength: 10,
      inputFormatters: [
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10),
      ],
      prefixIcon: hidePrefixIcon ? null : const Icon(Icons.phone),
      hintText: hintText ?? 'Mobile',
      validator: validator ?? Validator.mobileNo,
    );
  }
}
