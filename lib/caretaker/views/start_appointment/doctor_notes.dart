import 'dart:io';

import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:better_life_customer/caretaker/widgets/img_bottom_sheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class DoctorNotes extends StatefulWidget {
  const DoctorNotes({required this.apptId, super.key});
  final int apptId;

  @override
  State<DoctorNotes> createState() => _DoctorNotesState();
}

class _DoctorNotesState extends State<DoctorNotes> {
  final controller = Get.find<HomeController>();
  final notes = TextEditingController();
  final images = <String>[].obs;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Caretaker'),
      ),
      body: SingleChildScrollView(
        padding: kPadding,
        child: Column(
          children: [
            const HeaderText(text: 'Doctor Notes'),
            const Gap(20),
            MyTextField(
              autovalidateMode: AutovalidateMode.disabled,
              maxLines: 8,
              controller: notes,
              textInputAction: TextInputAction.done,
            ),
            const Gap(5),
            MyElevatedButton(
              width: 0.3.sw,
              text: 'Save',
              onPressed: () async {
                print('object');
                try {
                  await controller.createDocNotes(
                      notes: notes.text, imgs: images, apptId: widget.apptId);
                } catch (error) {
                  print('errror$error');
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
          ],
        ),
      ),
    );
  }
}
