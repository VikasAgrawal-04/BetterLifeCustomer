import 'package:api/api.dart';
import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:better_life_customer/caretaker/widgets/home_page_card.dart';
import 'package:better_life_customer/home/widgets/home_tabbar.dart';
import 'package:better_life_customer/home/widgets/my_drawer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class HomePageCaretaker extends StatefulWidget {
  const HomePageCaretaker({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(
        builder: (_) => const HomePageCaretaker(),
        settings: const RouteSettings(name: '/homePageCaretaker'));
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
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await homeControl.getCareAppointment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: key,
      bottomNavigationBar: _buttonAndTabbar(homeControl),
      appBar: MyAppBar(
        title: const Text('Better-Life Caretaker'),
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
      drawer: const MyDrawer(caretaker: true),
      body: Padding(
        padding: kPadding,
        child: Obx(
          () => RefreshIndicator(
            onRefresh: homeControl.rfh,
            child: MySliverList<CareAppointment>(
              title:
                  '${homeControl.tabs[homeControl.selectedIndex.value]} Appointments',
              status: homeControl.status.value,
              list: homeControl.homeAppointments,
              itemBuilder: (context, index) {
                final appontment = homeControl.homeAppointments[index];
                return Container(
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    child: CaretakerAppointmentCard(appointment: appontment));
              },
            ),
          ),
        ),
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
        tabs: homeControl.tabs,
        onTap: (index) async {
          homeControl.selectedIndex.value = index;
          await homeControl.getCareAppointment();
        },
      ),
    ),
  );
}
