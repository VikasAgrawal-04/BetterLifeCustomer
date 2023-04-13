import 'package:api/api.dart';
import 'package:better_life_customer/services/bottom_sheet_service.dart';
import 'package:better_life_customer/view_appointment/cubit/cubit.dart';
import 'package:better_life_customer/view_appointment/widgets/reschedule_appointment.dart';
import 'package:better_life_customer/widgets/appointment_card/card_header.dart';
import 'package:flutter/material.dart';
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
                        'Hospital: ${app.hospital}',
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
                _buildImages(state.diets, 'Diets'),
                const Gap(20),
                _buildImages(state.notes, 'Notes'),
                const Gap(20),
                _buildImages(state.tests, 'Tests'),
                const Gap(20),
                Row(
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
                    const Expanded(
                      child: MyElevatedButton(
                        text: 'Cancel',
                        color: Colors.red,
                        height: 38,
                      ),
                    ),
                  ],
                ),
                // _buildRow(Icons.dashboard_customize_sharp, 'Doctor: }'),
                // _buildRow(Icons.dashboard_customize_sharp, 'Doctor: }'),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<void> reschedule(BuildContext context) async {
    final id = context.read<ViewAppointmentCubit>().state.appointment.apptid;
    BottomSheetService.showSheet(
      child: RescheduleAppointment(
        onReschedule: (prams) async {
          await context.read<ViewAppointmentCubit>().reschedule(prams);
        },
        id: id!,
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
    return _container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const HeaderText(text: 'Caretakers'),
          const Gap(20),
          ListView.separated(
            separatorBuilder: (context, index) => const Gap(10),
            shrinkWrap: true,
            itemCount: caretakers.length,
            itemBuilder: (context, index) {
              final caretaker = caretakers[index];
              return Column(
                children: [
                  _buildRow(
                    Icons.person_outlined,
                    '${caretaker.fullname}',
                  ),
                  _buildDivider(),
                  _buildRow(
                    Icons.phone_outlined,
                    '${caretaker.mobile}',
                  ),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildDivider() => const Divider(
        color: Color(0xffD7E5FC),
        height: 15,
        thickness: 1,
      );

  Widget _buildRow(IconData icon, String text) {
    final color = Colors.grey.shade700;
    return Row(
      children: [
        Icon(
          icon,
          color: color,
          size: 20,
        ),
        const Gap(10),
        Text(
          text,
          style: TextStyle(
            color: color,
            fontSize: 16,
          ),
        ),
      ],
    );
  }

  Widget _buildImages(List<String> list, String heading) {
    return _container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HeaderText(text: heading),
          const Gap(20),
          GridView.builder(
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2,
              mainAxisSpacing: 20,
              crossAxisSpacing: 20,
            ),
            // separatorBuilder: (context, index) => const Gap(10),
            shrinkWrap: true,
            itemCount: list.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              final diet = list[index];
              return MyNetworkImage(
                urlToImage: diet,
                // height: 100,
                // width: 1.sw,
              );
            },
          ),
        ],
      ),
    );
  }
}
