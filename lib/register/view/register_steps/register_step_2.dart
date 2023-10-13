import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class RegisterStep2 extends StatelessWidget {
  const RegisterStep2({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaretakerController>();

    return Form(
      key: controller.key,
      child: SingleChildScrollView(
        padding: kPadding,
        child: AutoSpacing(
          spacing: const Gap(5),
          children: [
            MyTextField(
              hintText: 'Address',
              controller: controller.adress,
              textInputAction: TextInputAction.next,
            ),
            PincodeField(
              hintText: 'Pin Code',
              controller: controller.pinCode,
            ),
            MyTextField(
              hintText: 'Aadhar',
              controller: controller.aadhar,
              textInputAction: TextInputAction.next,
              textInputType: const TextInputType.numberWithOptions(),
              maxLength: 12,
            ),
            MyTextField(
              hintText: 'Qualification',
              controller: controller.qualification,
              textInputAction: TextInputAction.next,
            ),
            MyTextField(
              hintText: 'Currently employed at',
              controller: controller.curEmpl,
              textInputAction: TextInputAction.next,
            ),
            Obx(
              () => MyDropdownField<String>(
                title: 'Interested Profile',
                items: controller.profileList,
                value: controller.profile.value,
                onChanged: controller.profileChange,
              ),
            ),
            Obx(
              () => MyDropdownField<String>(
                title: 'Available For Interview',
                items: controller.interviewList,
                value: controller.interview.value,
                onChanged: controller.profileChange,
              ),
            ),
            const Gap(10),
            Row(
              children: [
                Expanded(
                  child: MyElevatedButton(
                      text: 'Back',
                      color: Colors.black,
                      onPressed: () async => controller.back()),
                ),
                SizedBox(width: 1.sw * 0.15),
                Expanded(
                  child: MyElevatedButton(
                    text: 'Next',
                    onPressed: () async {
                      controller.validatePage();
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
