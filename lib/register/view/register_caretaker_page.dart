import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:better_life_customer/register/view/register_steps/register_step_2.dart';
import 'package:better_life_customer/register/view/register_steps/register_step_3.dart';
import 'package:better_life_customer/register/view/register_steps/register_step_4.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

import 'register_steps/register_step_1.dart';

class RegisterCaretakerPage extends StatefulWidget {
  const RegisterCaretakerPage({super.key});

  static Route<dynamic> route() {
    return MaterialPageRoute(builder: (_) => const RegisterCaretakerPage());
  }

  @override
  State<RegisterCaretakerPage> createState() => _RegisterCaretakerPageState();
}

class _RegisterCaretakerPageState extends State<RegisterCaretakerPage> {
  final careControl = Get.find<CaretakerController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await careControl.fetchLanguages();
      await careControl.fetchPincodes();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() => Scaffold(
          appBar: MyAppBar(
            leading: IconButton(
                onPressed: () {
                  careControl.index.value = 0;
                  Get.back<void>();
                },
                icon: const Icon(Icons.arrow_back_ios)),
            title: Text(
              'Register As Caretaker (${careControl.index.value + 1} / 4)',
            ),
          ),
          body: PageView(
            physics: const NeverScrollableScrollPhysics(),
            controller: careControl.pageController,
            children: const [
              RegisterStep1(),
              RegisterStep2(),
              RegisterStep3(),
              RegisterStep4()
            ],
          ),
        ));
  }
}
