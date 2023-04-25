// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:api/api.dart';
import 'package:better_life_customer/service_rating/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class ServiceRatingCard extends StatefulWidget {
  const ServiceRatingCard({
    required this.caretaker,
    required this.apptId,
    required this.onRatingChanged,
    super.key,
  });
  final Caretaker caretaker;
  final int apptId;
  final ValueChanged<ServiceRatingParams> onRatingChanged;

  @override
  State<ServiceRatingCard> createState() => _ServiceRatingCardState();
}

class _ServiceRatingCardState extends State<ServiceRatingCard> {
  late final TextEditingController _controller = TextEditingController();
  double value = 0;

  @override
  void initState() {
    _controller.addListener(_listener);
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ServiceRatingStars(
          onChanged: onChanged,
          value: value,
        ),
        const Gap(20),
        MyTextField(
          hintText: 'Write your review',
          controller: _controller,
          validator: (value) => null,
          maxLines: 5,
        ),
      ],
    );
  }

  void onChanged(double value) {
    setState(() => this.value = value);
    _listener();
  }

  void _listener() {
    widget.onRatingChanged.call(
      ServiceRatingParams(
        caretakerId: widget.caretaker.userid!,
        appointmentId: widget.apptId,
        rating: value.toInt(),
        comment: _controller.text,
      ),
    );
  }
}
