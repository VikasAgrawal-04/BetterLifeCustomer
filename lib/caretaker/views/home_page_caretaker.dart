import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:better_life_customer/home/widgets/home_tabbar.dart';
import 'package:better_life_customer/home/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class HomePageCaretaker extends StatefulWidget {
  const HomePageCaretaker({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const HomePageCaretaker());
  }

  @override
  State<HomePageCaretaker> createState() => _HomePageCaretakerState();
}

class _HomePageCaretakerState extends State<HomePageCaretaker> {
  final key = GlobalKey<ScaffoldState>();
  final homeControl = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      bottomNavigationBar: _buttonAndTabbar(homeControl),
      appBar: MyAppBar(
        title: const Text('Better-Life'),
        leading: IconButton(
          onPressed: () {
            if (key.currentState?.isDrawerOpen ?? false) {
              key.currentState?.closeDrawer();
            } else {
              key.currentState?.openDrawer();
            }
          },
          icon: const Icon(Icons.menu),
        ),
      ),
      extendBody: true,
      extendBodyBehindAppBar: true,
      resizeToAvoidBottomInset: true,
      drawer: const MyDrawer(caretaker: true),
      body: const Padding(
        padding: kPadding,
        child: EmptyScreen(message: 'No data found'),
      ),
    );
  }
}

Widget _buttonAndTabbar(HomeController homeControl) {
  return Container(
    width: 1.sw,
    height: 1.sh * 0.16,
    padding: const EdgeInsets.only(bottom: 5, left: 12, right: 12),
    color: Colors.white,
    child: Obx(
      () => HomeTabbar(
        currentIndex: homeControl.selectedIndex.value,
        tabs: const ['Todays Appt', 'Past Appt', 'Upcoming Appt'],
        onTap: (index) async {
          homeControl.selectedIndex.value = index;
        },
      ),
    ),
  );
}
