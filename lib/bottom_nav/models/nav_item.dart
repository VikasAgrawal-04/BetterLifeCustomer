import 'package:flutter/cupertino.dart';

class BottomNavItem {
  BottomNavItem({
    required this.route,
    required this.text,
    required this.icon,
    required this.page,
  });
  final String text;
  final IconData icon;
  final Widget page;
  final String route;
}
