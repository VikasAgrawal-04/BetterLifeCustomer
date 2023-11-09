import 'package:better_life_customer/register/view/controller/caretaker_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class CarePincodeList extends StatefulWidget {
  const CarePincodeList({super.key});

  @override
  State<CarePincodeList> createState() => _CarePincodeListState();
}

class _CarePincodeListState extends State<CarePincodeList> {
  final careControl = Get.find<CaretakerController>();
  final pncd = 'Select Pincode'.obs;
  final status = Status.initial.obs;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      status.value = Status.loading;
      await careControl.fetchCarePincode();
      // await careControl.fetchPincodes();
      status.value = Status.success;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
        title: Text('Better-Life Caretaker'),
      ),
      body: Obx(
        () => StatusHandler(
          status: status.value,
          onSuccess: SingleChildScrollView(
            padding: kPadding,
            child: AutoSpacing(
              spacing: const Gap(15),
              children: [
                const HeaderText(text: 'PINCODE LIST'),
                Text(
                  'Can provide services in following pincodes',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Row(
                  children: [
                    Expanded(
                      child: MyDropdownField(
                        title: 'Select Pincode',
                        items: careControl.pincodes,
                        value: pncd.value,
                        onChanged: (value) {
                          pncd.value = value ?? pncd.value;
                        },
                      ),
                    ),
                    SizedBox(width: 12.w),
                    Expanded(
                      child: MyElevatedButton(
                        margin: EdgeInsets.only(top: 25.h),
                        text: 'Add To List',
                        onPressed: () async {
                          final value = careControl.carePincodes.firstWhere(
                            (element) => element['pincode'] == pncd.value,
                            orElse: () => null,
                          );

                          if (pncd.value != 'Select Pincode' && value == null) {
                            status.value = Status.loading;
                            await careControl.addCarePincode(pncd.value);
                            status.value = Status.success;
                          } else {
                            const GetSnackBar(
                              message: 'Please Choose A Different Pincode',
                              duration: Duration(seconds: 1),
                              backgroundColor: Colors.red,
                            ).show();
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
                  child: ListView.builder(
                    itemCount: careControl.carePincodes.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final pincode =
                          careControl.carePincodes[index]['pincode'];
                      return Row(
                        children: [
                          Text(pincode.toString()),
                          const Spacer(),
                          IconButton(
                            onPressed: () async {
                              status.value = Status.loading;
                              await careControl
                                  .deleteCarePincode(pincode.toString());
                              status.value = Status.success;
                            },
                            icon: const Icon(Icons.delete),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
