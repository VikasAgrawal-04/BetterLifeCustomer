import 'package:api/api.dart';
import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class CTNewAppointment extends StatefulWidget {
  const CTNewAppointment({super.key});
  static Route<dynamic> route() {
    return MaterialPageRoute<dynamic>(builder: (_) => const CTNewAppointment());
  }

  @override
  State<CTNewAppointment> createState() => _CTNewAppointmentState();
}

class _CTNewAppointmentState extends State<CTNewAppointment> {
  final controller = Get.find<HomeController>();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getNewAppointment();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(
        title: const Text('New Appointments'),
        onBackPressed: () async {
          controller.getCareAppointment();
          Get.back<void>();
        },
      ),
      body: WillPopScope(
        onWillPop: () async {
          controller.getCareAppointment();
          return true;
        },
        child: Padding(
          padding: kPadding,
          child: RefreshIndicator(
            child: Obx(
              () => MySliverList<CareAppointment>(
                title: 'New Appointments',
                status: controller.status.value,
                itemBuilder: (context, index) {
                  final appointment = controller.newAppointments[index];
                  return Container(
                    margin:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.2.h),
                    child: Card(
                      color: const Color.fromARGB(255, 97, 222, 145),
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 10.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  appointment.visitdate.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                ),
                                Text(
                                  appointment.pickuptime.toString(),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(fontWeight: FontWeight.w700),
                                )
                              ],
                            ),
                            const Gap(5),
                            Text(appointment.patientname.toString()),
                            const Gap(5),
                            Text(appointment.pickaddress.toString()),
                            const Gap(5),
                            Text(appointment.hospital.toString()),
                            const Gap(10),
                            Row(
                              children: [
                                Expanded(
                                  child: MyElevatedButton(
                                      text: 'Accept',
                                      height: 30.h,
                                      onPressed: () async {
                                        await controller.appointmentAction(
                                          accept: true,
                                          aptId: appointment.apptid ?? 0,
                                        );
                                      }),
                                ),
                                SizedBox(width: 1.sw * 0.15),
                                Expanded(
                                  child: MyElevatedButton(
                                    height: 30.h,
                                    text: 'Reject',
                                    color: Colors.black,
                                    onPressed: () async {
                                      await controller.appointmentAction(
                                        accept: false,
                                        aptId: appointment.apptid ?? 0,
                                      );
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
                },
                list: controller.newAppointments,
              ),
            ),
            onRefresh: () async {
              await controller.getNewAppointment();
            },
          ),
        ),
      ),
    );
  }
}
