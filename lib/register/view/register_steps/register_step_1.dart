import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class RegisterStep1 extends StatelessWidget {
  const RegisterStep1({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaretakerController>();
    return Form(
      key: controller.key,
      child: SingleChildScrollView(
        padding: kPadding,
        child: AutoSpacing(
          spacing: const Gap(10),
          children: [
            MyTextField(
              hintText: 'Full Name',
              controller: controller.fullName,
              textInputAction: TextInputAction.next,
            ),
            PhoneTextField(
              controller: controller.mobile,
            ),
            EmailField(
              controller: controller.email,
            ),
            PasswordField(
              hintText: 'Password',
              controller: controller.password,
              textInputAction: TextInputAction.next,
            ),
            PasswordField(
              hintText: 'Confirm Password',
              controller: controller.confirmPassword,
            ),
            Obx(
              () => MyDropdownField<String>(
                title: 'Gender',
                items: controller.genders2,
                value: controller.gender.value,
                onChanged: controller.genderChange,
              ),
            ),
            MyDateField(
              hintText: 'Date Of Birth',
              value: controller.dob,
              firstDate: DateTime(1900),
              lastDate: DateTime.now(),
              onChanged: (value) {
                controller.dob = value;
              },
            ),
            MyTextField(
              hintText: 'Driving License',
              controller: controller.licenseNo,
              textInputAction: TextInputAction.next,
            ),
            MyTextField(
              hintText: 'Valid Upto',
              controller: controller.valid,
              textInputAction: TextInputAction.next,
            ),
            const Gap(10),
            MyElevatedButton(
              text: 'Next',
              onPressed: () async {
                controller.validatePage();
              },
            )
          ],
        ),
      ),
    );
  }
}
