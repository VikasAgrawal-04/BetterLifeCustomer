import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:validators/validators.dart';

import 'helper/text_input_decoration.dart';

class MyTextField extends StatelessWidget {
  final void Function(String)? onChanged;
  final VoidCallback? onTap;
  final TextEditingController? controller;
  final String? hintText, initialValue;
  final Widget? prefixIcon;
  final Color? fillColor;
  final TextInputAction? textInputAction;
  final TextInputType? textInputType;
  final void Function(String)? onSubmitted;
  final String? Function(String?)? validator;
  final bool obscureText, filled;
  final Widget? suffixIcon;
  final FocusNode? focusNode;
  final int? maxLength;
  final bool isDense;
  final EdgeInsets? contentPadding;
  final TextStyle? hintStyle;
  final List<TextInputFormatter>? inputFormatters;
  final bool autoFocus;
  final bool enabled, readOnly;
  final AutovalidateMode autovalidateMode;
  final int? maxLines, minLine;
  final InputDecoration? decoration;
  final TextStyle? style;

  final TextCapitalization textCapitalization;

  const MyTextField({
    super.key,
    this.onChanged,
    this.readOnly = false,
    this.initialValue,
    this.autovalidateMode = AutovalidateMode.onUserInteraction,
    this.enabled = true,
    this.autoFocus = false,
    this.hintText,
    this.prefixIcon,
    this.controller,
    this.onSubmitted,
    this.fillColor,
    this.validator,
    this.textInputAction,
    this.textInputType,
    this.obscureText = false,
    this.suffixIcon,
    this.focusNode,
    this.maxLength,
    this.contentPadding,
    this.isDense = true,
    this.hintStyle,
    this.inputFormatters,
    this.textCapitalization = TextCapitalization.sentences,
    this.onTap,
    this.maxLines = 1,
    this.minLine,
    this.filled = true,
    this.decoration,
    this.style,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        if (hintText != null)
          Text(
            hintText!,
            style: Theme.of(context).textTheme.titleMedium,
          ),
        if (hintText != null) const SizedBox(height: 5),
        TextFormField(
          initialValue: initialValue,
          maxLength: maxLength,
          textCapitalization: textCapitalization,
          inputFormatters: inputFormatters,
          focusNode: focusNode,
          obscureText: obscureText,
          autovalidateMode: autovalidateMode,
          enabled: enabled,
          maxLines: maxLines,
          minLines: minLine,
          controller: controller,
          onChanged: onChanged,
          onFieldSubmitted: onSubmitted,
          keyboardType: textInputType,
          validator: validator ?? Validator.text,
          textInputAction: textInputAction,
          buildCounter: _buildCounter,
          style: style,
          onTap: onTap,
          autofocus: autoFocus,
          readOnly: readOnly,
          decoration: decoration ?? _inputDecoration(theme),
        ),
      ],
    );
  }

  InputDecoration _inputDecoration(ThemeData theme) {
    return InputDecoration(
      // labelText: hintText,
      contentPadding: contentPadding ?? TextInputDecoration.contentPadding,
      isDense: isDense,
      floatingLabelStyle: TextStyle(
        color: theme.primaryColor,
      ),
      labelStyle: const TextStyle(),
      prefixIconColor: theme.primaryColor,
      prefixIcon: prefixIcon,
      suffixIcon: suffixIcon,
      fillColor: fillColor ?? TextInputDecoration.inputFillColor,
      hintStyle: hintStyle ?? TextStyle(color: theme.primaryColor),
      filled: filled,
      enabledBorder: TextInputDecoration.inputBorder,
      focusedBorder: TextInputDecoration.inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: theme.primaryColor,
        ),
      ),
      disabledBorder: TextInputDecoration.inputBorder.copyWith(
        borderSide: BorderSide(
          width: 2,
          color: Colors.grey.shade200,
        ),
      ),
      border: TextInputDecoration.inputBorder,
    );
  }

  Widget? _buildCounter(
    BuildContext context, {
    required int currentLength,
    required bool isFocused,
    required int? maxLength,
  }) {
    return const SizedBox.shrink();
  }
}
