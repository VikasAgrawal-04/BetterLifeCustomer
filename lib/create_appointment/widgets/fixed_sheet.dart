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
      height: height ?? .95.sh,
      padding: EdgeInsets.symmetric(vertical: .015.sh, horizontal: .06.sw),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          bar(),
          SizedBox(height: .02.sh),
          Text(
            title,
            style: theme.bodyLarge?.copyWith(fontWeight: FontWeight.w600),
          ),
          Divider(height: .01.sh),
          ...children,
        ],
      ),
    ),
  );
}

Widget bar() {
  return Center(
    child: Container(
      width: .15.sw,
      height: .005.sh,
      color: const Color.fromARGB(255, 193, 195, 200),
    ),
  );
}
