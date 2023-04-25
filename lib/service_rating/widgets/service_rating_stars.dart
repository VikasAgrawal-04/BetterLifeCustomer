import 'package:flutter/material.dart';
import 'package:flutter_rating_stars/flutter_rating_stars.dart';

class ServiceRatingStars extends StatelessWidget {
  const ServiceRatingStars({
    this.onChanged,
    this.starSize = 50,
    super.key,
    this.value,
  });

  final double? value;
  final double starSize;
  final ValueChanged<double>? onChanged;

  @override
  Widget build(BuildContext context) {
    return RatingStars(
      value: value ?? 0.0,
      onValueChanged: onChanged,
      starBuilder: _starBuilder,
      animationDuration: const Duration(milliseconds: 375),
      starSize: starSize,
      maxValueVisibility: false,
      valueLabelVisibility: false,
    );
  }

  Icon _starBuilder(int index, Color? color) {
    return Icon(
      Icons.star,
      size: starSize,
      color: color,
    );
  }
}
