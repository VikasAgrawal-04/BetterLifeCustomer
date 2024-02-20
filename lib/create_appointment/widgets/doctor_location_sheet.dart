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
import 'package:geocoding/geocoding.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart' as gt;

Future<void> doctorSheet(
  BuildContext context, {
  required Future<void> Function(AddressCallback) callback,
}) async {
  final searchController = TextEditingController();
  final position = BlocProvider.of<LocationCubit>(context);
  final focusNode = FocusNode();
  await fixedSheet(context, 'Doctor Location', [
    MyTextField(
      focusNode: focusNode,
      textInputType: TextInputType.text,
      controller: searchController,
      textInputAction: TextInputAction.search,
      hintText: 'Search Location',
      prefixIcon: const Icon(Icons.search),
      onChanged: position.autoComplete,
    ),
    SizedBox(height: .025.sh),
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
                  await EasyLoading.show();
                  final location =
                      await locationFromAddress(address.description);
                  await EasyLoading.dismiss();
                  await gt.Get.to<void>(
                    PickupDropMaps(
                      latitude: location.first.latitude,
                      longitude: location.first.longitude,
                      drop: true,
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
