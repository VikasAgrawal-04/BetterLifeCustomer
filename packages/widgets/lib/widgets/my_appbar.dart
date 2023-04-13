import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class MyAppBar extends StatelessWidget with PreferredSizeWidget {
  final List<Widget> actions;
  final Color? backgroundColor;
  final Widget? title;
  final Widget? leading;
  final VoidCallback? onBackPressed;

  final PreferredSizeWidget? bottom;
  final double elevation;
  final Color? iconColor;
  final bool showBackButton, showDivider, centreTitle;

  const MyAppBar({
    super.key,
    this.actions = const [],
    this.title,
    this.elevation = 0.0,
    this.backgroundColor = Colors.white,
    this.iconColor,
    this.showBackButton = true,
    this.bottom,
    this.onBackPressed,
    this.leading,
    this.showDivider = true,
    this.centreTitle = true,
  });

  @override
  Widget build(BuildContext context) {
    final color = (backgroundColor ?? Theme.of(context).colorScheme.background)
                .computeLuminance() >
            0.5
        ? Colors.black.withOpacity(0.7)
        : Colors.white;
    final leadingArrow = _leadingIcon(context, color);
    return Theme(
      data: _themeData(context, color),
      child: AppBar(
        centerTitle: centreTitle,
        backgroundColor: backgroundColor ?? Colors.white,
        leading: leading ?? (showBackButton ? leadingArrow : const SizedBox()),
        leadingWidth: showBackButton ? null : null,
        actions: actions,
        title: title,
        elevation: elevation,
        bottom: bottom ?? _bottom(),
      ),
    );
  }

  ThemeData _themeData(BuildContext context, Color color) {
    return Theme.of(context).copyWith(
      appBarTheme: AppBarTheme(
        color: backgroundColor,
        elevation: elevation,
        iconTheme: IconThemeData(
          color: iconColor,
        ),
        titleTextStyle: TextStyle(
          color: color,
          fontSize: 20,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  Widget _leadingIcon(BuildContext context, Color color) {
    return Container(
      margin: const EdgeInsets.all(10),
      padding: const EdgeInsets.only(left: 8),
      // decoration: BoxDecoration(
      //   borderRadius: kBorderRadius,
      //   shape: BoxShape.rectangle,
      //   border: Border.all(color: Colors.grey.shade200),
      // ),
      child: GestureDetector(
        onTap: onBackPressed ?? Get.back,
        child: Icon(
          Icons.arrow_back_ios,
          color: color,
        ),
      ),
    );
  }

  PreferredSizeWidget _bottom() {
    return showDivider
        ? PreferredSize(
            preferredSize: const Size.fromHeight(4.0),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 25),
              color: Colors.grey.withOpacity(0.2),
              height: 1.0,
            ),
          )
        : const PreferredSize(
            preferredSize: Size.fromHeight(0), child: SizedBox());
  }

  @override
  Size get preferredSize => const Size.fromHeight(58);
}
