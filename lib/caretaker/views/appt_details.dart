import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class CareApptDetails extends StatefulWidget {
  const CareApptDetails({required this.apptId, super.key});
  final int apptId;

  @override
  State<CareApptDetails> createState() => _CareApptDetailsState();
}

class _CareApptDetailsState extends State<CareApptDetails> {
  final controller = Get.find<HomeController>();
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getApptDetails(widget.apptId);
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
          status: controller.status.value,
          onSuccess: SingleChildScrollView(
            padding: kPadding,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const HeaderText(text: 'Appointment Details'),
                const Gap(20),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    border: Border.all(
                      color: Colors.grey.withOpacity(0.3),
                    ),
                  ),
                  child: AutoSpacing(
                    spacing: const Gap(5),
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            controller.apptDetails.value.visitdate.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                          Text(
                            controller.apptDetails.value.pickuptime.toString(),
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(fontWeight: FontWeight.w700),
                          ),
                        ],
                      ),
                      Text(
                        controller.apptDetails.value.patientname?.toString() ??
                            '',
                      ),
                      Text(
                        controller.apptDetails.value.pickaddress?.toString() ??
                            '',
                      ),
                      Text(
                        'Hospital : ${controller.apptDetails.value.hospital}',
                      ),
                      Text(
                        'Doctor : ${controller.apptDetails.value.doctor}',
                      ),
                      Text(
                        'Patient Phone : ${controller.apptDetails.value.patientmobile}',
                      ),
                      const Gap(2),
                      const MyDivider(),
                      const Gap(2),
                      Text(
                        'Relative Name : ${controller.apptDetails.value.relativename}',
                      ),
                      Text(
                        'Relative Number : ${controller.apptDetails.value.relativemobileno}',
                      ),
                      const Gap(2),
                      const MyDivider(),
                      const Gap(2),
                      Text(
                        'Taxi Required : ${controller.apptDetails.value.taxineeded == "1" ? "True" : "False"}',
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                MyElevatedButton(
                  text: 'Start Appointment',
                  onPressed: () async {},
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
