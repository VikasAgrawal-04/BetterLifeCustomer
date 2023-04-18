import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class ServiceRating extends StatefulWidget {
  const ServiceRating({super.key, required this.appointmentId});
  final int appointmentId;

  @override
  State<ServiceRating> createState() => _ServiceRatingState();
}

class _ServiceRatingState extends State<ServiceRating> {
  double value = 0;
  final TextEditingController _controller = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    _controller.dispose();
    _formKey.currentState?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const MyAppBar(
          // title: 'Service Rating',
          ),
      body: Form(
        key: _formKey,
        child: SingleChildScrollView(
          padding: kPadding,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const HeaderText(
                text: 'Service Rating',
                fontSize: 26,
              ),
              const Gap(20),
              Text(
                'Share your experience in a scaling',
                style: context.textTheme.titleMedium,
              ),
              const Gap(10),
              RatingStars(
                value: value,
                onValueChanged: (v) {
                  setState(() {
                    value = v;
                  });
                },
                starBuilder: (index, color) => Icon(
                  Icons.star,
                  size: 50,
                  color: color,
                ),
                animationDuration: const Duration(milliseconds: 375),
                starSize: 50,
                maxValueVisibility: false,
                valueLabelVisibility: false,
              ),
              const Gap(20),
              MyTextField(
                hintText: 'Write your review',
                controller: _controller,
                maxLines: 5,
              ),
              const Gap(20),
              MyElevatedButton(
                text: 'Submit',
                onPressed: _onPressed,
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _onPressed() async {
    if (!(_formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (value <= 0) {
      DialogService.error('Please select rating');
      return;
    }

    final params = ServiceRatingParams(
      appointmentId: widget.appointmentId,
      rating1: value.toInt(),
      comment1: _controller.text,
    );
    final result = await context.read<ApiRepo>().serviceRating(params: params);
    result.when(
      success: (data) {
        DialogService.success(data, onTap: () => Get.close(2));
      },
      failure: DialogService.failure,
    );
  }
}
