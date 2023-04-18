import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class TimeButton extends StatelessWidget {
  const TimeButton({
    required this.time,
    super.key,
  });
  final String time;

  @override
  Widget build(BuildContext context) {
    return MyElevatedButton(
      width: 100,
      height: 35,
      color: context.theme.primaryColor.withOpacity(0.2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          const Gap(5),
          Icon(
            Icons.access_time,
            color: context.theme.primaryColor,
            size: 20,
          ),
          const Gap(5),
          Expanded(
            child: Text(
              time,
              overflow: TextOverflow.ellipsis,
              style: TextStyle(
                color: context.theme.primaryColor,
                fontSize: 14,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
