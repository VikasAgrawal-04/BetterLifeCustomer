// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../text_fields.dart';

class MyDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String? title;
  final String Function(T)? labelBuilder;
  final void Function(T?)? onChanged;

  const MyDropdownField({
    Key? key,
    required this.items,
    required this.value,
    this.title,
    this.labelBuilder,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return title == null ? _buildDropdown() : _buildDropdownWithTitle(context);
  }

  Widget _buildTitle(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Text(
        title ?? '',
        style: Theme.of(context).textTheme.titleMedium,
      ),
    );
  }

  Widget _buildDropdownWithTitle(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(context),
        const SizedBox(height: 10),
        _buildDropdown(),
      ],
    );
  }

  Widget _buildDropdown() {
    return Container(
      padding: TextInputDecoration.contentPadding.copyWith(top: 0, bottom: 0),
      decoration: decoration,
      child: DropdownButton(
        hint: const Text('Please select'),
        icon: const Icon(Icons.keyboard_arrow_down_sharp),
        items: items.map(_dropdownItem).toList(),
        onChanged: onChanged,
        isExpanded: true,
        underline: const SizedBox.shrink(),
        borderRadius: TextInputDecoration.inputBorderRadius,
        value: value,
      ),
    );
  }

  DropdownMenuItem<T> _dropdownItem(T e) {
    return DropdownMenuItem<T>(
      value: e,
      child: Text(
        labelBuilder?.call(e) ?? e.toString(),
        style: TextStyle(
          fontSize: 16,
          fontWeight: FontWeight.w600,
          color: Colors.grey.shade700,
        ),
      ),
    );
  }

  BoxDecoration get decoration => BoxDecoration(
        color: TextInputDecoration.inputFillColor,
        border: Border.all(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(
          TextInputDecoration.inputRadius,
        ),
      );
}
