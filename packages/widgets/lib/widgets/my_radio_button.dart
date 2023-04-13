import 'package:flutter/material.dart';

class MyRadioButton extends StatelessWidget {
  final String? text;
  final bool? value;
  final bool? selectedValue;
  final ValueChanged<bool?>? onChanged;
  const MyRadioButton({
    Key? key,
    this.text,
    this.value,
    this.selectedValue,
    this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (text == null) return _radio(context);
    return InkWell(
      onTap: () => onChanged?.call(value),
      child: Row(
        children: [
          if (text != null)
            Text(
              text!,
              style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 16,
                color: Colors.grey.shade600,
              ),
            ),
          _radio(context),
        ],
      ),
    );
  }

  Radio<bool?> _radio(BuildContext context) {
    return Radio<bool?>(
      materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
      value: value,
      groupValue: selectedValue,
      fillColor: MaterialStateProperty.all(Theme.of(context).primaryColor),
      onChanged: onChanged,
    );
  }
}
