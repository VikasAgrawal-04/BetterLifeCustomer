import 'package:api/api.dart';
import 'package:better_life_customer/service_rating/widgets/service_rating_stars.dart';
import 'package:better_life_customer/services/bottom_sheet_service.dart';
import 'package:better_life_customer/view_appointment/cubit/cubit.dart';
import 'package:better_life_customer/view_appointment/widgets/reschedule_appointment.dart';
import 'package:better_life_customer/view_appointment/widgets/show_data_grid.dart';
import 'package:better_life_customer/widgets/appointment_card/card_header.dart';
import 'package:flutter/material.dart';
import 'package:intents/intents.dart';
import 'package:widgets/widgets.dart';

/// {@template view_appointment_body}
/// Body of the ViewAppointmentPage.
///
/// Add what it does
/// {@endtemplate}
class ViewAppointmentBody extends StatelessWidget {
  /// {@macro view_appointment_body}
  const ViewAppointmentBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ViewAppointmentCubit, ViewAppointmentState>(
      builder: (context, state) {
        final app = state.appointment;
        return StatusHandler(
          status: state.status,
          onSuccess: SingleChildScrollView(
            padding: kPadding,
            child: Column(
              children: [
                _container(
                  child: Column(
                    children: [
                      CardHeader(
                        date: app.visitdate,
                        time: app.pickuptime,
                      ),
                      _buildDivider(),
                      const Gap(10),
                      _buildRow(
                        Icons.local_hospital_outlined,
                        'Hospital Location: ${app.hospital}',
                        location: true,
                      ),
                      _buildDivider(),
                      _buildRow(
                        Icons.person_2_outlined,
                        'Doctor: ${app.doctor}',
                      ),
                    ],
                  ),
                ),
                const Gap(20),
                _buildCaretakers(app.caretakers ?? []),
                const Gap(20),
                Visibility(
                  visible: state.type.isPast,
                  child: GridView(
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 10 / 3,
                    ),
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    shrinkWrap: true,
                    children: [
                      MyElevatedButton(
                        text: 'Diets',
                        onPressed: () async => Get.to<void>(
                          () => ShowDataGrid(
                            heading: 'Diets',
                            list: state.diets,
                          ),
                        ),
                      ),
                      MyElevatedButton(
                        text: 'Notes',
                        onPressed: () async => Get.to<void>(
                          () => ShowDataGrid(
                            heading: 'Notes',
                            list: state.notes,
                          ),
                        ),
                      ),
                      MyElevatedButton(
                        text: 'Tests',
                        onPressed: () async => Get.to<void>(
                          () => ShowDataGrid(
                            heading: 'Tests',
                            list: state.tests,
                          ),
                        ),
                      ),
                      MyElevatedButton(
                        text: 'Prescriptions',
                        onPressed: () async => Get.to<void>(
                          () => ShowDataGrid(
                            heading: 'Prescriptions',
                            list: state.prescriptions,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Visibility(
                  visible: state.type.isFuture,
                  child: Row(
                    children: [
                      Expanded(
                        flex: 2,
                        child: MyElevatedButton(
                          text: 'Reschedule',
                          color: const Color(0xffF4B85B),
                          height: 38,
                          onPressed: () async => reschedule(context),
                        ),
                      ),
                      const Gap(30),
                      Expanded(
                        child: MyElevatedButton(
                          text: 'Cancel',
                          color: Colors.red,
                          height: 38,
                          onPressed: () {
                            return Get.defaultDialog<void>(
                              titleStyle: Get.textTheme.bodyMedium,
                              backgroundColor: Colors.white,
                              middleText: '',
                              title:
                                  'Are you sure you want to proceed with canceling the appointment?',
                              textConfirm: 'Yes',
                              confirmTextColor: Colors.white,
                              onConfirm:
                                  context.read<ViewAppointmentCubit>().cancel,
                              onCancel: () {
                                Get.back<void>();
                              },
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> reschedule(BuildContext context) async {
    final appt = context.read<ViewAppointmentCubit>().state.appointment;
    BottomSheetService.showSheet(
      child: RescheduleAppointment(
        onReschedule: (prams) async {
          await context.read<ViewAppointmentCubit>().reschedule(prams);
        },
        id: appt.apptid!,
        appt: appt,
      ),
    );
  }

  Widget _container({required Widget child}) {
    return Container(
      padding: kPadding,
      decoration: BoxDecoration(
        color: const Color(0xffF1F7FC),
        borderRadius: BorderRadius.circular(10),
      ),
      child: child,
    );
  }

  Widget _buildCaretakers(List<Caretaker> caretakers) {
    if (caretakers.isEmpty) {
      return const SizedBox.shrink();
    }
    return _container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(text: 'Caretakers'),
          const Gap(20),
          ListView.separated(
            physics: const NeverScrollableScrollPhysics(),
            separatorBuilder: (context, index) => Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: _buildDivider(),
            ),
            shrinkWrap: true,
            itemCount: caretakers.length,
            itemBuilder: (context, index) {
              final caretaker = caretakers[index];
              return Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _buildRow(
                        Icons.person_outlined,
                        '${caretaker.fullname}',
                      ),
                      const Gap(10),
                      _buildRow(
                        Icons.phone_outlined,
                        '${caretaker.mobile}',
                        isPhone: true,
                      ),
                    ],
                  ),
                  const Spacer(),
                  _buildRateServiceButton(caretaker.rating),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildRateServiceButton(int? rating) {
    if (rating != null) {
      return ServiceRatingStars(
        starSize: 30,
        value: rating.toDouble(),
      );
    } else {
      return const SizedBox.shrink();
    }
  }

  Widget _buildDivider() => const Divider(
        color: Color(0xffD7E5FC),
        height: 15,
        thickness: 1,
      );

  Widget _buildRow(
    IconData icon,
    String text, {
    bool isPhone = false,
    bool location = false,
  }) {
    final color = Colors.grey.shade700;
    return GestureDetector(
      onTap: () => isPhone
          ? Intents.dialIntent(text)
          : location
              ? Intents.openMap(text)
              : null,
      child: Row(
        children: [
          Icon(
            icon,
            color: color,
            size: 20,
          ),
          const Gap(10),
          if (isPhone) ...{
            DialPhone(
              phone: text,
              onTap: () => Intents.dialIntent(text),
            ),
          },
          if (!isPhone) ...{
            Expanded(
              child: Text(
                text,
                style: TextStyle(
                  color: color,
                  fontSize: 16,
                ),
              ),
            ),
          },
        ],
      ),
    );
  }
}
