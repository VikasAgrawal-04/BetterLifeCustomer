import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:widgets/widgets.dart';

class LocationListTile extends StatelessWidget {
  const LocationListTile({
    required this.location,
    required this.distance,
    required this.subLocation,
    required this.press,
    super.key,
  });
  final String location;
  final int distance;
  final String subLocation;
  final VoidCallback press;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: press,
      leading: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset('assets/svg/location.svg'),
          if (distance != 0) ...{
            SizedBox(height: 1.h),
            Text(
              '${(distance / 1000).toStringAsFixed(1)} km',
              style: Get.textTheme.labelSmall?.copyWith(letterSpacing: -0.3),
            ),
          },
        ],
      ),
      title: Text(
        location,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Get.textTheme.bodySmall,
      ),
      subtitle: Text(
        subLocation,
        maxLines: 2,
        overflow: TextOverflow.ellipsis,
        style: Get.textTheme.labelSmall?.copyWith(letterSpacing: -0.3),
      ),
    );
  }
}
