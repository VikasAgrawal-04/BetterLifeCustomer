import 'package:api/api.dart';
import 'package:better_life_customer/caretaker/widgets/img_helpers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class DietDetails extends StatelessWidget {
  const DietDetails(
      {required this.dietImgs, required this.dietNotes, super.key});
  final List<AppointmentSubDetails> dietImgs;
  final List<AppointmentNotes> dietNotes;

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
            const HeaderText(text: 'DIET RESTRICTIONS'),
            const Gap(20),
            ...List.generate(dietNotes.length, (index) {
              return Padding(
                padding: EdgeInsets.only(bottom: 5.h),
                child: Text('${index + 1}.  ${dietNotes[index].filetext}'),
              );
            }),
            const Gap(10),
            const MyDivider(),
            const Gap(10),
            Text('Images', style: Get.textTheme.titleLarge),
            const Gap(10),
            ...List.generate(dietImgs.length, (index) {
              final img = dietImgs[index].image;
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
