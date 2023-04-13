import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_cubit.dart';
import 'package:better_life_customer/bottom_nav/cubit/bottom_nav_state.dart';
import 'package:better_life_customer/bottom_nav/models/nav_item.dart';
import 'package:better_life_customer/home/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class BottomNavView extends StatefulWidget {
  const BottomNavView({super.key});

  @override
  State<BottomNavView> createState() => _BottomNavViewState();
}

class _BottomNavViewState extends State<BottomNavView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: Globals.drawerKey,
      // drawer: MyDrawer(),
      // backgroundColor: context.theme.colorScheme.background,
      body: BlocBuilder<BottomNavCubit, BottomNavState>(
        builder: (context, state) {
          return state.page;
          // return MySlideAnimation(
          //   verticalOffset: 10,
          //   curve: Curves.linearToEaseOut,
          //   duration: 375.milliseconds,
          //   key: ValueKey(value),
          //   child: value,
          // );
          // return cubit.navItems[value].page;
        },
      ),
      bottomNavigationBar: const MyBottomNavBar(),
    );
  }
}

class MyBottomNavBar extends StatelessWidget {
  const MyBottomNavBar({super.key, this.onTap});
  final VoidCallback? onTap;

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<BottomNavCubit>();
    return BlocBuilder<BottomNavCubit, BottomNavState>(
      builder: (context, state) {
        return _BottomNavbar(
          currentIndex: state.selectedIndex,
          isActive: context.read<BottomNavCubit>().isActive,
          onTap: (s) {
            cubit.setSelected(s);
            onTap?.call();
          },
          children: state.navItems,
        );
      },
    );
  }
}

class _BottomNavbar extends StatefulWidget {
  // final Widget page;
  const _BottomNavbar({
    this.children = const [],
    this.currentIndex = 0,
    this.onTap,
    this.isActive = true,
  });
  final List<BottomNavItem> children;
  final ValueChanged<int>? onTap;
  final int currentIndex;
  final bool isActive;

  @override
  State<_BottomNavbar> createState() => _BottomNavbarState();
}

class _BottomNavbarState extends State<_BottomNavbar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAlias,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(10.r),
          topRight: Radius.circular(10.r),
        ),
        boxShadow: const [
          BoxShadow(
            color: Color.fromARGB(59, 169, 169, 169),
            spreadRadius: 10,
            blurRadius: 16,
          ),
        ],
      ),
      child: BottomNavigationBar(
        currentIndex: widget.currentIndex,
        onTap: widget.onTap,
        showUnselectedLabels: true,
        type: BottomNavigationBarType.fixed,
        unselectedLabelStyle: const TextStyle(color: Colors.black),
        selectedLabelStyle: const TextStyle(color: Colors.black),
        elevation: 5,
        fixedColor: _isCurrentRoute(),
        items: widget.children
            .map(
              (e) => BottomNavigationBarItem(
                icon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Icon(
                    e.icon,
                    color: Colors.black,
                  ),
                ),
                activeIcon: Padding(
                  padding: const EdgeInsets.only(bottom: 5, top: 10),
                  child: Icon(
                    e.icon,
                    color: _isCurrentRoute(),
                  ),
                ),
                label: e.text,
              ),
            )
            .toList(),
      ),
    );
  }

  Color _isCurrentRoute() =>
      widget.isActive ? context.theme.primaryColor : Colors.white;
}

class BottomNavbarItem extends StatelessWidget {
  const BottomNavbarItem({
    required this.text,
    this.color = Colors.red,
    this.iconData,
    this.onTap,
    this.image,
    this.imagecolor,
    this.size,
    super.key,
  });

  final VoidCallback? onTap;
  final String text;
  final Color color;
  final IconData? iconData;
  final Color? imagecolor;
  final String? image;
  final double? size;

  @override
  Widget build(BuildContext context) {
    const color = Color.fromARGB(255, 255, 255, 255);

    // final size = MediaQuery.of(context).size;
    final imageSize = size ?? MediaQuery.of(context).size.aspectRatio * 0.05;
    return GestureDetector(
      onTap: () => onTap?.call(),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey.shade300),
          color: color,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              iconData,
              size: imageSize,
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 120.w,
              child: AutoSizeText(
                text,
                textAlign: TextAlign.center,
                maxLines: text.split(' ').length > 1 ? 2 : 1,
                style: ThemeData.light().textTheme.bodyMedium?.copyWith(
                      fontWeight: FontWeight.w600,
                      fontSize: 16.w,
                    ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Widget _image(String path) {
  //   final isSvg = path.endsWith('.svg');
  //   final svgImage = SvgPicture.asset(path);
  //   final image = Image.asset(path);
  //   return SizedBox(
  //     child: isSvg ? svgImage : image,
  //   );
  // }
}
