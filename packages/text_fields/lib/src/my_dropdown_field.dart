import 'package:flutter/material.dart';

import '../text_fields.dart';

class MyDropdownField<T> extends StatelessWidget {
  final List<T> items;
  final T? value;
  final String? title;
  final void Function(T?)? onChanged;

  const MyDropdownField({
    super.key,
    required this.items,
    required this.value,
    this.onChanged,
    this.title,
  });

  @override
  Widget build(BuildContext context) {
    return title == null ? _buildDropdown() : _buildDropdownWithTitle();
  }

  Widget _buildTitle() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 0),
      child: Text(
        title ?? '',
        style: TextInputDecoration.labelTextStyle,
      ),
    );
  }

  Widget _buildDropdownWithTitle() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        _buildTitle(),
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
        e.toString(),
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
