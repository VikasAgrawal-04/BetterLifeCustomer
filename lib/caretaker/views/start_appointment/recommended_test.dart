import 'dart:developer';
import 'dart:io';

import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:better_life_customer/caretaker/widgets/img_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class RecommendedTest extends StatefulWidget {
  const RecommendedTest({required this.apptId, super.key});
  final int apptId;

  @override
  State<RecommendedTest> createState() => _RecommendedTestState();
}

class _RecommendedTestState extends State<RecommendedTest> {
  final textController = TextEditingController();
  final images = <String>[].obs;
  final tests = <String>[].obs;
  final controller = Get.find<HomeController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Caretaker'),
      ),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Column(children: [
          const HeaderText(text: 'RECOMMENDED TESTS'),
          const Gap(20),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Enter Test Name',
              style: Get.textTheme.titleMedium,
            ),
          ),
          const Gap(5),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: MyTextField(
                controller: textController,
                autovalidateMode: AutovalidateMode.disabled,
                textInputAction: TextInputAction.done,
              )),
              SizedBox(width: 8.w),
              Expanded(
                child: MyElevatedButton(
                  height: 0.056.sh,
                  text: 'Add To List',
                  onPressed: () async {
                    if (!tests.contains(textController.text.trim()) &&
                        textController.text.isNotEmpty) {
                      tests.add(textController.text);
                    } else {
                      const GetSnackBar(
                        message: 'Test Already Added',
                        backgroundColor: Colors.redAccent,
                        duration: Duration(milliseconds: 600),
                      ).show();
                    }
                    textController.clear();
                  },
                ),
              ),
            ],
          ),
          const Gap(10),
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Test List',
              style: Get.textTheme.titleMedium,
            ),
          ),
          const Gap(5),
          Obx(
            () => Container(
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(5),
              ),
              child: tests.isEmpty
                  ? const Center(
                      child: Text('No Tests Added'),
                    )
                  : ListView.builder(
                      itemCount: tests.length,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        final test = tests[index];
                        return Row(
                          children: [
                            Text(test),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                tests.removeAt(index);
                              },
                              icon: const Icon(Icons.delete),
                            ),
                          ],
                        );
                      }),
            ),
          ),
          const Gap(20),
          MyElevatedButton(
            width: 0.3.sw,
            text: 'Save',
            onPressed: () async {
              try {
                if (images.isNotEmpty || tests.isNotEmpty) {
                  await controller.createTests(
                      imgs: images, apptId: widget.apptId, tests: tests);
                }
              } catch (error) {
                log('errror$error');
              }
            },
          ),
          const Gap(10),
          const MyDivider(),
          const Gap(10),
          Row(
            children: [
              const Spacer(),
              const Text('Upload Photos'),
              SizedBox(width: 0.2.sw),
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
              ),
            ],
          ),
          const Gap(5),
          Obx(
            () => Align(
              alignment: Alignment.centerLeft,
              child: Wrap(
                spacing: 0.03.sw,
                runSpacing: 0.02.sh,
                children: List.generate(
                  images.length,
                  (index) {
                    return Stack(
                      children: [
                        SizedBox(
                          width: 100.w,
                          child: Image.file(
                            File(images[index]),
                          ),
                        ),
                        Positioned(
                          right: -15,
                          top: -12,
                          child: IconButton(
                              onPressed: () {
                                images.removeAt(index);
                              },
                              icon: const Icon(Icons.delete)),
                        )
                      ],
                    );
                  },
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
