import 'package:api/api.dart';
import 'package:better_life_customer/caretaker/views/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets/widgets.dart';

class CaretakerAppointmentCard extends StatefulWidget {
  const CaretakerAppointmentCard({required this.appointment, super.key});
  final CareAppointment appointment;

  @override
  State<CaretakerAppointmentCard> createState() =>
      _CaretakerAppointmentCardState();
}

class _CaretakerAppointmentCardState extends State<CaretakerAppointmentCard> {
  final controller = Get.find<HomeController>();

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
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.appointment.visitdate.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
              Text(
                widget.appointment.pickuptime.toString(),
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium
                    ?.copyWith(fontWeight: FontWeight.w700),
              ),
            ],
          ),
          const Gap(5),
          Text(widget.appointment.patientname.toString()),
          const Gap(5),
          Text(widget.appointment.pickaddress.toString()),
          const Gap(5),
          Text(widget.appointment.hospital.toString()),
          const Gap(10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              if (widget.appointment.rating != null) ...{
                RatingBar(
                  allowHalfRating: true,
                  initialRating: widget.appointment.rating?.toDouble() ?? 0.0,
                  ratingWidget: RatingWidget(
                    full: SvgPicture.asset(
                      'assets/svg/full_star.svg',
                    ),
                    half: SvgPicture.asset(
                      'assets/svg/half_star.svg',
                    ),
                    empty: SvgPicture.asset(
                      'assets/svg/empty_star.svg',
                    ),
                  ),
                  onRatingUpdate: (value) {},
                )
              },
              if (widget.appointment.viewDetials)
                MyElevatedButton(
                  text: 'View Details',
                  width: 100.w,
                  height: 30.h,
                  onPressed: () async {
                    await controller
                        .viewDetails(widget.appointment.apptid ?? 0);
                  },
                ),
            ],
          )
        ],
      ),
    );
  }
}
