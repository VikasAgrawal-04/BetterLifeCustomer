import 'package:api/api.dart';
import 'package:api_client/api_client.dart';
import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:better_life_customer/caretaker/views/past_appointment/diet_details.dart';
import 'package:better_life_customer/caretaker/views/past_appointment/doctor_notes_details.dart';
import 'package:better_life_customer/caretaker/views/past_appointment/precription_details.dart';
import 'package:better_life_customer/caretaker/views/past_appointment/tests_details.dart';
import 'package:better_life_customer/caretaker/views/start_appointment/diet_restrictions.dart';
import 'package:better_life_customer/caretaker/views/start_appointment/doctor_notes.dart';
import 'package:better_life_customer/caretaker/views/start_appointment/prescription.dart';
import 'package:better_life_customer/caretaker/views/start_appointment/recommended_test.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_theme/my_theme.dart';
import 'package:pin_code_text_field/pin_code_text_field.dart';
import 'package:widgets/widgets.dart';

class CareApptDetails extends StatefulWidget {
  const CareApptDetails({required this.apptId, super.key});
  final int apptId;

  @override
  State<CareApptDetails> createState() => _CareApptDetailsState();
}

class _CareApptDetailsState extends State<CareApptDetails> {
  final controller = Get.find<HomeController>();
  final otp = TextEditingController();

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await controller.getApptDetails(widget.apptId);
    });
  }

  Future<void> getAppt() async {
    await controller.getCareAppointment();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await getAppt();
        return true;
      },
      child: Scaffold(
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
                    padding:
                        EdgeInsets.symmetric(horizontal: 8.w, vertical: 5.h),
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
                              controller.apptDetails.value.pickuptime
                                  .toString(),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyMedium
                                  ?.copyWith(fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                        Text(
                          controller.apptDetails.value.patientname
                                  ?.toString() ??
                              '',
                        ),
                        Text(
                          controller.apptDetails.value.pickaddress
                                  ?.toString() ??
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
                  if (controller.apptDetails.value.startappointment == '0' &&
                      controller.currentAppointmentType ==
                          AppointmentType.present &&
                      controller.apptDetails.value.finished != '1')
                    MyElevatedButton(
                      text: 'Start Appointment',
                      onPressed: () async {
                        await Get.defaultDialog<void>(
                          title: 'ENTER OTP',
                          content: PinCodeTextField(
                            controller: otp,
                            pinBoxHeight: 50,
                            pinBoxWidth: 50,
                            defaultBorderColor: kLightGrey,
                            pinBoxColor: kLightGrey,
                            hasTextBorderColor: kLightGrey,
                            onDone: (text) async {
                              Get.back<void>();
                              await controller.verifyPatientOtp(
                                otp: text,
                                apptId:
                                    controller.apptDetails.value.apptid ?? 0,
                              );
                            },
                            pinBoxRadius: kBorderRadius.topLeft.x,
                            highlight: true,
                            wrapAlignment: WrapAlignment.spaceBetween,
                            pinBoxOuterPadding:
                                const EdgeInsets.symmetric(horizontal: 10),
                            highlightColor: context.theme.primaryColor,
                          ),
                          cancel: MyElevatedButton(
                            text: 'Cancel',
                            width: 80.w,
                            height: 35.h,
                            color: Colors.grey,
                            onPressed: () async {
                              Get.back<void>();
                            },
                          ),
                          confirm: MyElevatedButton(
                            width: 80.w,
                            height: 35.h,
                            text: 'OK',
                            onPressed: () async {
                              Get.back<void>();
                              if (otp.text.length < 4) {
                                DialogService.failure(
                                  const NetworkExceptions.defaultError(
                                    'Please enter valid otp',
                                  ),
                                );
                              } else {
                                await controller.verifyPatientOtp(
                                  otp: otp.text,
                                  apptId:
                                      controller.apptDetails.value.apptid ?? 0,
                                );
                              }
                            },
                          ),
                        );
                      },
                    ),
                  if (controller.apptDetails.value.startappointment == '1' &&
                      controller.currentAppointmentType ==
                          AppointmentType.present &&
                      controller.apptDetails.value.finished != '1') ...{
                    AutoSpacing(
                      spacing: const Gap(10),
                      children: [
                        Align(
                          child: Text(
                            'Appointment Started at ${controller.apptDetails.value.startdatetime}',
                          ),
                        ),
                        MyElevatedButton(
                          text: 'Mark As Completed',
                          color: Colors.redAccent,
                          onPressed: () async {
                            await controller.endAppt(
                              controller.apptDetails.value.apptid ?? 0,
                            );
                          },
                        ),
                        const MyDivider(),
                        Align(
                          child: Text(
                            'DATA ENTRY',
                            style: Get.textTheme.titleLarge,
                          ),
                        ),
                        const Gap(10),
                        Row(
                          children: [
                            Expanded(
                              child: MyElevatedButton(
                                text: 'Doctor Notes',
                                onPressed: () async {
                                  await Get.to<void>(
                                    DoctorNotes(
                                      apptId:
                                          controller.apptDetails.value.apptid ??
                                              0,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: MyElevatedButton(
                                text: 'Prescription',
                                onPressed: () async {
                                  await Get.to<void>(
                                    Prescription(
                                      apptId:
                                          controller.apptDetails.value.apptid ??
                                              0,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const Gap(5),
                        Row(
                          children: [
                            Expanded(
                              child: MyElevatedButton(
                                text: 'Recommended Tests',
                                onPressed: () async {
                                  await Get.to<void>(
                                    RecommendedTest(
                                      apptId:
                                          controller.apptDetails.value.apptid ??
                                              0,
                                    ),
                                  );
                                },
                              ),
                            ),
                            SizedBox(width: 8.w),
                            Expanded(
                              child: MyElevatedButton(
                                text: 'Diet Restrictions',
                                onPressed: () async {
                                  await Get.to<void>(
                                    DietRestriction(
                                      apptId:
                                          controller.apptDetails.value.apptid ??
                                              0,
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  },
                  if (controller.apptDetails.value.finished == '1') ...{
                    Center(
                      child: Text(
                        'THIS APPOINTMENT HAS BEEN COMPLETED',
                        style: Get.textTheme.titleMedium
                            ?.copyWith(color: Colors.greenAccent),
                      ),
                    ),
                    Gap(30),
                    Row(
                      children: [
                        Expanded(
                          child: MyElevatedButton(
                            text: 'Doctor Notes',
                            onPressed: () async {
                              await Get.to<void>(
                                DoctorNotesDetails(
                                  docNotes: controller.apptDetails.value
                                          .appointmentDoctorsNoteNotes ??
                                      [],
                                  notesImgs: controller.apptDetails.value
                                          .appointmentDoctorsNote ??
                                      [],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: MyElevatedButton(
                            text: 'Prescription',
                            onPressed: () async {
                              await Get.to<void>(
                                PrescriptionDetails(
                                  presImgs: controller.apptDetails.value
                                          .appointmentPrescription ??
                                      [],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                    const Gap(10),
                    Row(
                      children: [
                        Expanded(
                          child: MyElevatedButton(
                            text: 'Recommended Tests',
                            onPressed: () async {
                              await Get.to<void>(
                                TestDetails(
                                  testImgs: controller
                                          .apptDetails.value.appointmentTest ??
                                      [],
                                  tests: controller.apptDetails.value
                                          .appointmentTestNotes ??
                                      [],
                                ),
                              );
                            },
                          ),
                        ),
                        SizedBox(width: 8.w),
                        Expanded(
                          child: MyElevatedButton(
                            text: 'Diet Restrictions',
                            onPressed: () async {
                              await Get.to<void>(
                                DietDetails(
                                  dietImgs: controller
                                          .apptDetails.value.appointmentDiet ??
                                      [],
                                  dietNotes: controller.apptDetails.value
                                          .appointmentDietNotes ??
                                      [],
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    ),
                  },
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
