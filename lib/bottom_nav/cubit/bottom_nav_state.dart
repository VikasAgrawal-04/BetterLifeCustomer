// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:better_life_customer/bottom_nav/models/nav_item.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class BottomNavState extends Equatable {
  final int selectedIndex;
  final List<BottomNavItem> navItems;
  final Widget page;
  const BottomNavState({
    required this.selectedIndex,
    required this.navItems,
    required this.page,
  });
  @override
  List<Object> get props => [selectedIndex, navItems, page];

  BottomNavState copyWith({
    int? selectedIndex,
    List<BottomNavItem>? navItems,
    Widget? page,
  }) {
    return BottomNavState(
      selectedIndex: selectedIndex ?? this.selectedIndex,
      navItems: navItems ?? this.navItems,
      page: page ?? this.page,
    );
  }
}
