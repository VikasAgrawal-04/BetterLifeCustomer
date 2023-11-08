import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class AppInfo extends StatefulWidget {
  const AppInfo({super.key});

  @override
  State<AppInfo> createState() => _AppInfoState();
}

class _AppInfoState extends State<AppInfo> {
  final homeControl = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await homeControl.showAppInfo();
    });
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        homeControl.getCareAppointment();
        return true;
      },
      child: Scaffold(
        appBar: MyAppBar(
          title: const Text('Better-Life Caretaker'),
          onBackPressed: () async {
            homeControl.getCareAppointment();
            Get.back<void>();
          },
        ),
        body: Obx(() => StatusHandler(
            status: homeControl.status.value,
            onSuccess: SingleChildScrollView(
              padding: kPadding,
              child: Column(
                children: [
                  const HeaderText(text: 'About Us'),
                  const Gap(10),
                  Obx(() => Text(
                      homeControl.appInfo['data']['description'].toString()))
                ],
              ),
            ))),
      ),
    );
  }
}
