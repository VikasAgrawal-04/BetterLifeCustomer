import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class RegisterStep3 extends StatelessWidget {
  const RegisterStep3({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaretakerController>();
    return Form(
      key: controller.key,
      child: SingleChildScrollView(
        padding: kPadding,
        child: Obx(
          () => AutoSpacing(
            spacing: const Gap(5),
            children: [
              Text(
                'Languages Known',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              ...List.generate(controller.languages.length, (index) {
                final language = controller.languages[index];
                return Row(
                  children: [
                    Checkbox(
                      checkColor: Colors.black,
                      fillColor: MaterialStatePropertyAll(Colors.grey.shade400),
                      value: controller.selectedLanguages.contains(language),
                      onChanged: (value) {
                        controller.selectLang(language, value ?? false);
                      },
                    ),
                    SizedBox(width: 8.w),
                    Text(
                      language,
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                  ],
                );
              }),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: MyElevatedButton(
                      text: 'Back',
                      color: Colors.black,
                      onPressed: () async => controller.back(),
                    ),
                  ),
                  SizedBox(width: 1.sw * 0.15),
                  Expanded(
                    child: MyElevatedButton(
                      text: 'Next',
                      onPressed: () async {
                        if (controller.selectedLanguages.isEmpty) {
                          const GetSnackBar(
                            message: 'Select Language',
                            duration: Duration(seconds: 2),
                            backgroundColor: Colors.red,
                          ).show();
                        } else {
                          controller.validatePage();
                        }
                      },
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
