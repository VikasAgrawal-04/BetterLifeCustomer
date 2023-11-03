import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:widgets/widgets.dart';

Future<void> imgSheet({
  required Future<String?> Function(String?) onPick,
}) async {
  return Get.bottomSheet(
    Container(
      width: 1.sw,
      constraints: BoxConstraints(minHeight: 20.h),
      decoration: const ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          )),
      padding: EdgeInsets.symmetric(vertical: .01.sh, horizontal: .04.sw),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Center(
              child: Container(
                width: .22.sw,
                height: 0.005.sh,
                color: const Color(0xFFEBEDF2),
              ),
            ),
            const Gap(20),
            Text('Upload Image', style: Get.textTheme.titleMedium),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final imgPath = await pickImg(type: ImageSource.camera);
                      onPick(imgPath);
                      Get.back<void>();
                    },
                    child: Container(
                      height: 0.1.sh,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: .01.sh),
                            const Icon(Icons.camera_alt_outlined),
                            SizedBox(height: .02.sh),
                            const Text('Take Picture'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(width: .08.sw),
                Expanded(
                  child: InkWell(
                    onTap: () async {
                      final imgPath = await pickImg(type: ImageSource.gallery);
                      onPick(imgPath);
                      Get.back<void>();
                    },
                    child: Container(
                      height: 0.1.sh,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        shadows: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: .01.sh),
                            const Icon(Icons.camera_sharp),
                            SizedBox(height: .02.sh),
                            const Text('From Gallery'),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const Gap(10),
          ],
        ),
      ),
    ),
    isScrollControlled: true,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.only(
        topLeft: Radius.circular(40),
        topRight: Radius.circular(40),
      ),
    ),
  );
}

Future<String?> pickImg({required ImageSource type}) async {
  final image = await ImagePicker().pickImage(source: type);
  return image?.path;
}
