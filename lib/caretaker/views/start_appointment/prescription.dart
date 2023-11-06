import 'dart:io';

import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:better_life_customer/caretaker/widgets/img_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class Prescription extends StatefulWidget {
  const Prescription({required this.apptId, super.key});
  final int apptId;

  @override
  State<Prescription> createState() => _PrescriptionState();
}

class _PrescriptionState extends State<Prescription> {
  final images = <String>[].obs;
  final controller = Get.find<HomeController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Caretaker'),
      ),
      bottomNavigationBar: Padding(
        padding: EdgeInsets.symmetric(horizontal: 0.08.sw),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            IconButton(
              onPressed: () async {
                await imgSheet(onPick: (value) async {
                  if (value != null) {
                    images.add(value);
                  }
                  return null;
                });
              },
              icon: const Icon(Icons.camera_alt),
              iconSize: 80.sp,
            ),
            SizedBox(width: 16.w),
            MyElevatedButton(
              width: .45.sw,
              text: 'Save',
              onPressed: () async {
                if (images.isNotEmpty) {
                  await controller.createPrescription(
                      imgs: images, apptId: widget.apptId);
                }
              },
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Obx(() => Column(
              children: [
                const HeaderText(text: 'PRESCRIPTION'),
                const Gap(20),
                ...List.generate(images.length, (index) {
                  return Stack(
                    children: [
                      Container(
                        margin: EdgeInsets.only(bottom: 0.02.sh),
                        constraints:
                            BoxConstraints(maxHeight: .6.sh, minWidth: 1.sw),
                        padding: EdgeInsets.symmetric(
                            horizontal: 8.w, vertical: 5.h),
                        decoration: BoxDecoration(
                          border: Border.all(),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: Image.file(File(images[index])),
                      ),
                      Positioned(
                        bottom: 10,
                        right: -10,
                        child: IconButton(
                          onPressed: () {
                            images.removeAt(index);
                          },
                          icon: const Icon(Icons.delete),
                          iconSize: 30.sp,
                        ),
                      )
                    ],
                  );
                })
              ],
            )),
      ),
    );
  }
}
