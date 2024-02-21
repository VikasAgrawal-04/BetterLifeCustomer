import 'package:api/api.dart';
import 'package:better_life_customer/home/cubit/cubit.dart';
import 'package:better_life_customer/location/views/location_page.dart';
import 'package:better_life_customer/widgets/appointment_card/appointment_card.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class HomeBody extends StatelessWidget {
  const HomeBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeCubit, HomeState>(
      builder: (context, state) {
        final cubit = context.read<HomeCubit>();
        return Padding(
          padding: kPadding,
          child: RefreshIndicator(
            onRefresh: cubit.refresh,
            child: MySliverList<Appointment>(
              title: '${state.tabs[state.currentIndex]} Appointments',
              status: state.status,
              list: state.appointments,
              itemBuilder: (context, index) {
                final appointment = state.appointments[index];
                return Container(
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: AppointmentCard(
                    type: AppointmentType.values[state.currentIndex],
                    appointment: appointment,
                    onPressed: () => cubit.viewAppointment(appointment),
                    onEnd: () => cubit.endAppt(appointment.apptid),
                    onMap: () async {
                      if (appointment.apptid != null &&
                          appointment.hospitalLatitude != null &&
                          appointment.hospitalLongitude != null) {
                        await Get.to<void>(
                          LocationPage(
                            apptId: appointment.apptid!,
                            hospitalLat: appointment.hospitalLatitude!,
                            hospitalLong: appointment.hospitalLongitude!,
                          ),
                        );
                      }
                    },
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
