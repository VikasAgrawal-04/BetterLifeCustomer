// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';

class DropdownOtherOption<T> extends StatelessWidget {
  const DropdownOtherOption({
    Key? key,
    required this.items,
    this.value,
    this.title,
    this.otherTitle,
    this.labelBuilder,
    this.onChanged,
    this.onOtherChanged,
    this.isOther = false,
  }) : super(key: key);

  final List<T> items;
  final T? value;
  final String? title;
  final String? otherTitle;

  final String Function(T)? labelBuilder;
  final void Function(T?)? onChanged;
  final void Function(String?)? onOtherChanged;
  final bool isOther;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      child: Column(
        children: [
          MyDropdownField<T>(
            items: items,
            value: value,
            labelBuilder: labelBuilder,
            onChanged: onChanged,
            title: title,
          ),
          Visibility(
            visible: isOther,
            child: Padding(
              padding: const EdgeInsets.only(top: 20),
              child: MyTextField(
                hintText: otherTitle ?? 'Please specify',
                onChanged: (value) => onOtherChanged?.call(value),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
