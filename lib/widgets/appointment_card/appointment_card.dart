import 'package:api/api.dart';
import 'package:better_life_customer/service_rating/service_rating.dart';
import 'package:better_life_customer/widgets/appointment_card/time_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:widgets/widgets.dart';

class AppointmentCard extends StatelessWidget {
  const AppointmentCard({
    required this.appointment,
    required this.type,
    this.onMap,
    this.onEnd,
    super.key,
    this.onPressed,
  });

  final FutureVoidCallback? onPressed;
  final FutureVoidCallback? onMap;

  final FutureVoidCallback? onEnd;

  final Appointment appointment;
  final AppointmentType type;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: kPadding,
      decoration: _decoration(),
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
          _buildRow(Icons.location_on, appointment.pickaddress ?? ''),
          const Gap(10),
          _buildRow(
            Icons.local_hospital,
            'Hospital: ${appointment.hospital ?? ''}',
          ),
          Visibility(
            visible: type.isPresent,
            child: _buildOtp(),
          ),
          const Gap(10),
          Visibility(
            visible: type.isPresent && appointment.startappointment == '1',
            child: _buildNavigation(),
          ),
          Visibility(
            visible: !type.isPresent,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _buildViewButton(),
                Visibility(
                  visible: type.isPast && !hasRating(),
                  child: _buildRateServiceButton(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavigation() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        HeaderText(
            text: 'Caretaker Status : ${appointment.caretakerApptStatus}'),
        const Gap(10),
        Row(
          children: [
            Expanded(
              child: MyElevatedButton(
                text: 'Location',
                onPressed: onMap,
              ),
            ),
            SizedBox(width: 25.w),
            Expanded(
              child: MyElevatedButton(
                text: 'End Appointment',
                onPressed: onEnd,
              ),
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildRateServiceButton() {
    return MyElevatedButton(
      height: 30,
      width: 120,
      child: const Text(
        'Rate Service',
        style: TextStyle(
          color: Colors.white,
          fontSize: 14,
        ),
      ),
      onPressed: () async {
        await Get.to<void>(
          () => ServiceRatingPage(
            apptId: appointment.apptid!,
            caretakers: appointment.caretakers ?? [],
          ),
        );
      },
    );
  }

  MyElevatedButton _buildViewButton() {
    return MyElevatedButton(
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
    );
  }

  Column _buildOtp() {
    return Column(
      children: [
        const Gap(20),
        HeaderText(
          text: 'OTP: ${appointment.otp}',
          style: const TextStyle(color: Colors.red),
        ),
      ],
    );
  }

  BoxDecoration _decoration() {
    return BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(10),
      border: Border.all(
        color: Colors.grey.withOpacity(0.3),
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
        _buildButton(context, appointment.pickuptime),
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
        Expanded(
          child: Text(
            text,
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              color: color,
              fontSize: 14,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildButton(BuildContext context, String? time) {
    return TimeButton(
      time: time ?? '',
    );
  }

  bool hasRating() {
    if (appointment.rating != null || appointment.rating2 != null) {
      return true;
    }
    return false;
  }
}
