import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:month_year_picker/month_year_picker.dart';
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
          child: Obx(
            () => AutoSpacing(
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
                MyDropdownField<String>(
                  title: 'Gender',
                  items: controller.genders2,
                  value: controller.gender.value,
                  onChanged: controller.genderChange,
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
                ChoiceWidget(
                  value: controller.canDrive.value,
                  title: 'Can Drive',
                  onChanged: controller.drive,
                ),
                if (controller.canDrive.isTrue) ...{
                  MyTextField(
                    hintText: 'Driving License Number',
                    controller: controller.licenseNo,
                    textInputAction: TextInputAction.next,
                  ),
                  MyTextField(
                    hintText: 'Valid Upto',
                    controller: controller.valid,
                    readOnly: true,
                    textInputAction: TextInputAction.next,
                    onTap: () async {
                      final selected = await showMonthYearPicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime.now(),
                        lastDate: DateTime(2100),
                        builder: (context, child) {
                          return Theme(
                            data: ThemeData.light(),
                            child: Container(
                              child: child,
                            ),
                          );
                        },
                      );
                      if (selected != null) {
                        final formatter = DateFormat('MM/yyyy');
                        controller.valid.text = formatter.format(selected);
                      }
                    },
                  ),
                },
                const Gap(10),
                MyElevatedButton(
                  text: 'Next',
                  onPressed: () async {
                    controller.validatePage();
                  },
                ),
              ],
            ),
          )),
    );
  }
}
