import 'package:api/api.dart';
import 'package:better_life_customer/caretaker/widgets/img_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class PrescriptionDetails extends StatelessWidget {
  const PrescriptionDetails({required this.presImgs, super.key});
  final List<AppointmentSubDetails> presImgs;

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
            const HeaderText(text: 'PRESCRIPTION'),
            const Gap(20),
            Text('Images', style: Get.textTheme.titleLarge),
            const Gap(10),
            ...List.generate(presImgs.length, (index) {
              final img = presImgs[index].image;
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
