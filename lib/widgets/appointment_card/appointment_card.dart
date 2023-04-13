// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/api.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    required this.isViewButttonVisible,
    required this.appointment,
    this.onPressed,
    super.key,
  });

  final FutureVoidCallback? onPressed;
  final bool isViewButttonVisible;
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10),
        border: Border.all(
          color: Colors.grey.withOpacity(0.3),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _buildHeader(context),
          const Gap(10),
          const MyDivider(),
          const Gap(10),
          _buildRow(
            Icons.supervisor_account,
            'Assigned Caretaker: ${appointment.caretakerName}',
          ),
          const Gap(10),
          _buildRow(Icons.location_on, appointment.caretakerName),
          const Gap(10),
          _buildRow(
            Icons.local_hospital,
            'Hospital: ${appointment.hospital ?? ''}',
          ),
          const Gap(20),
          const HeaderText(
            text: 'OTP: ',
            style: TextStyle(color: Colors.red),
          ),
          const Gap(10),
          Visibility(
            visible: isViewButttonVisible,
            child: Row(
              children: [
                MyElevatedButton(
                  text: 'View',
                  height: 30,
                  width: 70,
                  color: const Color(0xff7DE773),
                  onPressed: onPressed,
                  child: const Text(
                    'View',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Row _buildHeader(BuildContext context) {
    return Row(
      children: [
        HeaderText(
          text: appointment.visitdate ?? '',
          fontSize: 18,
        ),
        const Spacer(),
        _buildButton(context),
      ],
    );
  }

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
            fontSize: 14,
          ),
        ),
      ],
    );
  }

  MyElevatedButton _buildButton(BuildContext context) {
    return MyElevatedButton(
      width: 100,
      height: 35,
      color: context.theme.primaryColor.withOpacity(0.2),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.access_time,
            color: context.theme.primaryColor,
            size: 20,
          ),
          const Gap(5),
          Text(
            appointment.pickuptime ?? '',
            style: TextStyle(
              color: context.theme.primaryColor,
              fontSize: 14,
            ),
          ),
        ],
      ),
    );
  }
}
