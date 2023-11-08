import 'package:api/api.dart';
import 'package:better_life_customer/caretaker/widgets/img_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class TestDetails extends StatelessWidget {
  const TestDetails({required this.testImgs, required this.tests, super.key});
  final List<AppointmentSubDetails> testImgs;
  final List<AppointmentNotes> tests;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Caretaker'),
      ),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const HeaderText(text: 'RECOMMENDED TESTS'),
            const Gap(20),
            ...List.generate(tests.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Text('${index + 1}.  ${tests[index].filetext}'),
              );
            }),
            const Gap(10),
            const MyDivider(),
            const Gap(10),
            Text('Images', style: Get.textTheme.titleLarge),
            const Gap(10),
            ...List.generate(testImgs.length, (index) {
              final img = testImgs[index].image;
              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: ImgHelper.imgFromBase64(img),
              );
            })
          ],
        ),
      ),
    );
  }
}
