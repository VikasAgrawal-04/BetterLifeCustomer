// ignore_for_file: public_member_api_docs, sort_constructors_first

import 'package:flutter/material.dart';
import 'package:validators/validators.dart';

import 'my_text_field.dart';

class PasswordField extends StatefulWidget {
  final void Function(String)? onChanged, onSubmitted;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final String? hintText;
  final TextInputAction textInputAction;
  final bool hidePrefixIcon;
  const PasswordField({
    Key? key,
    this.onSubmitted,
    this.validator,
    this.controller,
    this.onChanged,
    this.hintText,
    this.textInputAction = TextInputAction.done,
    this.hidePrefixIcon = true,
  }) : super(key: key);

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool obscureText = true;

  void updateObscureText() {
    obscureText = !obscureText;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final iconColor = Theme.of(context).iconTheme.color;
    return MyTextField(
      controller: widget.controller,
      validator: widget.validator ?? Validator.password,
      onChanged: widget.onChanged,
      obscureText: obscureText,
      suffixIcon: IconButton(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        icon: Icon(
          obscureText
              ? Icons.visibility_outlined
              : Icons.visibility_off_outlined,
          color: iconColor,
        ),
        onPressed: updateObscureText,
      ),
      hintText: widget.hintText ?? 'Password',
      onSubmitted: widget.onSubmitted,
      textInputAction: widget.textInputAction,
      textInputType: TextInputType.visiblePassword,
      inputFormatters: const [],
      prefixIcon:
          widget.hidePrefixIcon ? null : const Icon(Icons.lock_outlined),
    );
  }
}
