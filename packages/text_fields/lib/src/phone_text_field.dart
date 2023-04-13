import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:text_fields/text_fields.dart';
import 'package:validators/validators.dart';

class PhoneTextField extends StatelessWidget {
  final TextEditingController? controller;
  final String? hintText;
  final bool hidePrefixIcon;
  final String? Function(String?)? validator;
  const PhoneTextField({
    super.key,
    this.controller,
    this.hintText,
    this.validator,
    this.hidePrefixIcon = true,
  });

  @override
  Widget build(BuildContext context) {
    return MyTextField(
      controller: controller,
      textInputType: TextInputType.phone,
      textInputAction: TextInputAction.next,
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
