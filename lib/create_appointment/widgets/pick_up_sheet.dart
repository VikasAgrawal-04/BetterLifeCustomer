import 'package:api/api.dart';
import 'package:better_life_customer/create_appointment/widgets/fixed_sheet.dart';
import 'package:better_life_customer/create_appointment/widgets/location_list_title.dart';
import 'package:better_life_customer/create_appointment/widgets/pickup_drop_maps.dart';
import 'package:better_life_customer/location/cubit/location_cubit.dart';
import 'package:better_life_customer/location/cubit/location_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geocoding/geocoding.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart' as gt;
import 'package:widgets/widgets/widgets.dart';

Future<void> pickUpLocation(
  BuildContext context, {
  required Future<void> Function(AddressCallback) callback,
}) async {
  final position = BlocProvider.of<LocationCubit>(context);
  final searchController = TextEditingController();
  final yourLocation = await placemarkFromCoordinates(
    position.state.currentPosition.latitude ?? 0.0,
    position.state.currentPosition.longitude ?? 0.0,
  );
  final focusNode = FocusNode();
  // await EasyLoading.dismiss();
  await fixedSheet(context, 'Pickup Location', [
    MyElevatedButton(
      child: Row(
        children: [
          SvgPicture.asset('assets/svg/target.svg'),
          SizedBox(width: 4.w),
          Expanded(
            child: Text(
              '${yourLocation.first.name}+${yourLocation.first.street}, ${yourLocation.first.thoroughfare}, ${yourLocation.first.subLocality}, ${yourLocation.first.locality}, ${yourLocation.first.postalCode}',
              style: gt.Get.textTheme.bodySmall?.copyWith(color: Colors.white),
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
        ],
      ),
      onPressed: () async {
        await gt.Get.to<void>(
          PickupDropMaps(
            latitude: position.state.currentPosition.latitude ?? 0.0,
            longitude: position.state.currentPosition.longitude ?? 0.0,
            callback: callback,
          ),
          transition: gt.Transition.downToUp,
        );
      },
    ),
    MyTextField(
      focusNode: focusNode,
      textInputType: TextInputType.text,
      controller: searchController,
      textInputAction: TextInputAction.search,
      hintText: 'Search Location',
      prefixIcon: const Icon(Icons.search),
      onChanged: position.autoComplete,
    ),
    SizedBox(height: 2.5.sh),
    BlocBuilder<LocationCubit, LocationState>(
      builder: (context, state) {
        return Expanded(
          child: ListView.builder(
            itemCount: state.prediction.length,
            itemBuilder: (context, index) {
              final address = state.prediction[index];
              return LocationListTile(
                location: address.structuredFormatting.mainText,
                distance: address.distance,
                subLocation: address.structuredFormatting.secondaryText,
                press: () async {
                  focusNode.unfocus();
                  // await EasyLoading.show();
                  final location =
                      await locationFromAddress(address.description);
                  // await EasyLoading.dismiss();
                  await gt.Get.to<void>(
                    PickupDropMaps(
                      latitude: location.first.latitude,
                      longitude: location.first.longitude,
                      callback: callback,
                    ),
                    transition: gt.Transition.rightToLeft,
                  );
                },
              );
            },
          ),
        );
      },
    ),
  ]);
}
