import 'package:better_life_customer/create_appointment/widgets/simple_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> fixedSheet(
  BuildContext context,
  String title,
  List<Widget> children, {
  double? height,
}) async {
  final theme = Theme.of(context).textTheme;
  return bottomSheet(
    context: context,
    child: Container(
      height: height ?? 98.sh,
      padding: EdgeInsets.symmetric(vertical: 1.5.sh, horizontal: 6.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bar(),
          SizedBox(height: 2.0.sh),
          Text(
            title,
            style: theme.bodyMedium?.copyWith(fontWeight: FontWeight.w600),
          ),
          Divider(height: 3.sh),
          ...children,
        ],
      ),
    ),
  );
}

Widget bar() {
  return Center(
    child: Container(
      width: 22.w,
      height: 0.5.h,
      color: const Color(0xFFEBEDF2),
    ),
  );
}
