// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class ChoiceWidget extends StatelessWidget {
  final bool value;
  final String title;
  final ValueChanged<bool> onChanged;
  const ChoiceWidget({
    super.key,
    required this.value,
    required this.title,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: EdgeInsets.zero,
      dense: true,
      title: Text(
        title,
        style: const TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 18,
        ),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          MyRadio(
            groupValue: value,
            label: 'YES',
            value: true,
            onChanged: onChanged,
          ),
          const Gap(5),
          MyRadio(
            groupValue: value,
            label: 'NO',
            value: false,
            onChanged: onChanged,
          ),
        ],
      ),
    );
  }
}

class MyRadio extends StatelessWidget {
  final String label;
  final bool value;
  final bool groupValue;
  final ValueChanged<bool> onChanged;
  const MyRadio({
    Key? key,
    required this.label,
    required this.value,
    required this.groupValue,
    required this.onChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onChanged(value),
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
        decoration: const BoxDecoration(
          borderRadius: kBorderRadius,
          color: Color.fromARGB(126, 232, 232, 232),
        ),
        child: Row(
          children: [
            Padding(
              padding: EdgeInsets.zero,
              child: Radio<bool>(
                visualDensity: const VisualDensity(
                  horizontal: VisualDensity.minimumDensity,
                  vertical: VisualDensity.minimumDensity,
                ),
                // materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                materialTapTargetSize: MaterialTapTargetSize.shrinkWrap,
                value: value,
                groupValue: groupValue,
                activeColor: Colors.black,
                onChanged: (v) {
                  onChanged.call(value);
                },
              ),
            ),
            const Gap(5),
            Text(
              label.toUpperCase(),
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
