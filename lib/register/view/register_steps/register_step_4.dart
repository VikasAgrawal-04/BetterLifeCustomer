import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class RegisterStep4 extends StatelessWidget {
  const RegisterStep4({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = Get.find<CaretakerController>();
    return Form(
      key: controller.key,
      child: SingleChildScrollView(
        padding: kPadding,
        child: Obx(
          () => AutoSpacing(
            spacing: const Gap(15),
            children: [
              Text(
                'Can provide services in following pincodes',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Row(
                children: [
                  Expanded(
                    child: MyDropdownField(
                      title: 'Select Pincode',
                      items: controller.pincodes,
                      value: controller.pncd.value,
                      onChanged: controller.selectPincode,
                    ),
                  ),
                  SizedBox(width: 12.w),
                  Expanded(
                    child: MyElevatedButton(
                      margin: EdgeInsets.only(top: 25.h),
                      text: 'Add To List',
                      onPressed: () async {
                        if (controller.pncd.value != 'Select Pincode') {
                          await controller.setPincode(controller.pncd.value);
                        }
                      },
                    ),
                  ),
                ],
              ),
              const Gap(10),
              Text(
                'Selected Pincode List',
                style: Theme.of(context).textTheme.titleMedium,
              ),
              Container(
                constraints: BoxConstraints(maxHeight: 250.h),
                padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                decoration: BoxDecoration(
                  border: Border.all(),
                  borderRadius: BorderRadius.circular(5),
                ),
                child: controller.selectedPincodes.isEmpty
                    ? const Center(
                        child: Text('No Pincodes Added'),
                      )
                    : Scrollbar(
                        thumbVisibility: true,
                        trackVisibility: true,
                        child: ListView.builder(
                          shrinkWrap: true,
                          itemCount: controller.selectedPincodes.length,
                          itemBuilder: (context, index) {
                            final pincodes = controller.selectedPincodes[index];

                            return Row(
                              children: [
                                Text(pincodes),
                                const Spacer(),
                                IconButton(
                                  onPressed: () {
                                    controller.selectedPincodes.removeAt(index);
                                  },
                                  icon: const Icon(Icons.delete),
                                ),
                              ],
                            );
                          },
                        ),
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
                    flex: 2,
                    child: MyElevatedButton(
                      text: 'Complete Registration',
                      onPressed: controller.completeRegistration,
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
