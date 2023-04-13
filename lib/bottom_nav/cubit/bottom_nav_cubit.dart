import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_state.dart';
import 'package:better_life_customer/bottom_nav/models/nav_item.dart';
import 'package:better_life_customer/history/view/history_page.dart';
import 'package:better_life_customer/home/view/home_page.dart';
import 'package:better_life_customer/profile/profile.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit()
      : super(
          BottomNavState(
            selectedIndex: 0,
            navItems: navItems,
            page: navItems.first.page,
          ),
        );

  List<Widget> get pages {
    return navItems.map((e) => e.page).toList();
  }

  bool get isActive {
    if (Get.currentRoute != '/BottomNavPage') {
      return false;
    }
    final isActive = navItems
        .map((e) => e.page.runtimeType)
        .contains(state.page.runtimeType);
    return isActive;
  }

  void setPage(Widget page) {
    emit(state.copyWith(page: page));
  }

  void setSelected(int index) {
    final page = navItems[index].page;

    emit(
      state.copyWith(
        selectedIndex: index,
        page: page,
      ),
    );
    // if (_selectedIndex != index) {
    // }
  }

  static List<BottomNavItem> get navItems {
    return <BottomNavItem>[
      BottomNavItem(
        text: 'Home',
        icon: Icons.home,
        page: const HomePage(),
        route: '/HomePage',
      ),
      BottomNavItem(
        text: 'Rewards',
        icon: Icons.reviews,
        page: const HistoryPage(),
        route: '/RewardPage',
      ),
      BottomNavItem(
        text: 'History',
        icon: Icons.history,
        page: const HistoryPage(),
        route: '/HistoryPage',
      ),
      BottomNavItem(
        text: 'Profile',
        icon: Icons.account_circle_outlined,
        page: const ProfilePage(),
        route: '/ProfilePage',
      ),
    ];
  }
}
