import 'package:better_life_customer/create_appointment/cubit/create_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class AppointmentStep1 extends StatelessWidget {
  const AppointmentStep1({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<CreateAppointmentCubit>();
        return Padding(
          padding: kPadding,
          child: AutoSpacing(
            spacing: const Gap(5),
            children: [
              MyDateField(
                onChanged: cubit.dateOfVisitChanged,
                hintText: 'Date of visit',
                value: state.dateOfVisit,
              ),
              MyTimeField(
                label: 'Pick up time',
                onChanged: cubit.onPickupTimeChanged,
                time: state.pickupTime,
              ),
              MyTextField(
                hintText: 'Pick up address',
                controller: state.pickupAddressController,
                textInputAction: TextInputAction.next,
              ),
              PincodeField(
                hintText: 'Pick up pincode',
                controller: state.pickupPincodeController,
                readOnly: !state.isPincodeEditable,
              ),
              MyTextField(
                hintText: 'Hospital',
                controller: state.hospitalController,
                textInputAction: TextInputAction.next,
              ),
              MyTextField(
                hintText: "Doctor's name",
                controller: state.doctorsNameController,
                textInputAction: TextInputAction.next,
              ),
              MyDropdownField<String>(
                title: 'Purpose of visit',
                items: const ['Check Up', 'Consultation', 'Surgery', 'Other'],
                value: state.purposeOfVisit,
                onChanged: cubit.purposeOfVisitChanged,
              ),
              const Gap(20),
              Row(
                children: [
                  Expanded(
                    child: MyElevatedButton(
                      text: 'Back',
                      color: Colors.black,
                      onPressed: () async => Get.back<void>(),
                    ),
                  ),
                  SizedBox(width: 1.sw * 0.15),
                  Expanded(
                    child: MyElevatedButton(
                      text: 'Next',
                      onPressed: () async => cubit.validateStep1(),
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }
}
