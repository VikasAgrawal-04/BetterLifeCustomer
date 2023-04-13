// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class HomeTabbar extends StatelessWidget {
  const HomeTabbar({
    required this.tabs,
    required this.currentIndex,
    required this.onTap,
    super.key,
  });

  final List<String> tabs;
  final int currentIndex;
  final ValueChanged<int> onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 0.9.sw,
      alignment: Alignment.center,
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 30,
      // ),
      child: ClipRRect(
        borderRadius: kBorderRadius,
        child: ColoredBox(
          color: const Color(0xffF4F4F6),
          child: Row(
            children: tabs.map(
              (e) {
                final isSelectedIndex = currentIndex == tabs.indexOf(e);
                final bgColor = isSelectedIndex
                    ? context.theme.primaryColor
                    : const Color(0xffF4F4F6);
                final textColor = isSelectedIndex ? Colors.white : Colors.black;
                return Expanded(
                  // left: 0 + (tabs.indexOf(e) * 0.3.sw),
                  child: _tab(e, bgColor, textColor),
                );
              },
            ).toList(),
          ),
        ),
      ),
    );
  }

  GestureDetector _tab(String e, Color bgColor, Color textColor) {
    return GestureDetector(
      onTap: () => onTap(tabs.indexOf(e)),
      child: AnimatedContainer(
        decoration: BoxDecoration(
          color: bgColor,
          borderRadius: kBorderRadius,
        ),
        duration: const Duration(milliseconds: 300),
        padding: const EdgeInsets.symmetric(vertical: 12),
        child: Text(
          e,
          textAlign: TextAlign.center,
          style: TextStyle(
            color: textColor,
          ),
        ),
      ),
    );
  }
}
