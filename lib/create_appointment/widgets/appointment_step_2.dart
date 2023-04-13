import 'package:better_life_customer/create_appointment/cubit/create_appointment_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:text_fields/text_fields.dart';
import 'package:widgets/widgets.dart';

class AppointmentStep2 extends StatelessWidget {
  const AppointmentStep2({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateAppointmentCubit, CreateAppointmentState>(
      builder: (context, state) {
        final cubit = context.read<CreateAppointmentCubit>();
        return SingleChildScrollView(
          padding: kPadding,
          child: AutoSpacing(
            spacing: const Gap(10),
            children: [
              MyTextField(
                controller: state.patientNameController,
                hintText: 'Patient Name',
              ),
              MyDropdownField<String>(
                title: 'Patient Gender',
                items: state.genders,
                value: state.gender,
                onChanged: cubit.onGenderChanged,
              ),
              MyDropdownField(
                title: 'Relationship with applicant',
                value: state.relationWithApplicant,
                items: state.relationsWithApplicant,
                onChanged: cubit.onRelationsWithApplicantChange,
              ),
              PhoneTextField(
                hintText: 'Mobile Number',
                controller: state.mobileNumberController,
              ),
              MyDropdownField<String>(
                title: 'How many caretakers required?',
                value: state.caretakersCount,
                items: state.caretakersCountList,
                onChanged: cubit.onCaretakersCountChanged,
              ),
              MyDropdownField(
                title: 'Preferred caretaker gender',
                value: state.caretakerGender,
                items: state.genders,
                onChanged: cubit.onCaretakerGenderChanged,
              ),
              ChoiceWidget(
                title: 'Taxi Required',
                value: state.taxiRequired,
                onChanged: cubit.onTaxiRequiredChanged,
              ),
              AnimatedSize(
                duration: 300.milliseconds,
                child: state.taxiRequired
                    ? MyDropdownField(
                        title: 'Preferred taxi type',
                        items: state.taxiTypes,
                        value: state.taxiType,
                        onChanged: cubit.onTaxiTypeChanged,
                      )
                    : const SizedBox.shrink(),
              ),
              // Visibility(

              //   child: ChoiceWidget(
              //     title: 'Taxi Required',
              //     value: state.taxiRequired,
              //     onChanged: cubit.onTaxiRequiredChanged,
              //   ),
              // ),
              MyDropdownField(
                title: 'Preferred caretaker language',
                value: state.caretakerLanguage,
                items: state.caretakerLanguageList,
                onChanged: cubit.onCareTakersLanguageChanged,
              ),
              MyDropdownField(
                title: 'Appointment duration (in hours)',
                value: state.appointmentDuration,
                items: state.apppointmentDurationList,
                onChanged: cubit.onAppointmentDurationChanged,
              ),
              ChoiceWidget(
                title: 'Want caretaker who can drive your car',
                value: state.caretakerWhoCanDriveCar,
                onChanged: cubit.caretakerWhoCanDriveCarChanged,
              ),
              // ChoiceWidget(
              //   title: 'Taxi Required',
              //   value: state.taxiRequired,
              //   onChanged: cubit.onTaxiRequiredChanged,
              // ),
              const Gap(10),
              Row(
                children: [
                  Expanded(
                    child: MyElevatedButton(
                      text: 'Back',
                      color: Colors.black,
                      onPressed: () async => cubit.changeStep(state.step - 1),
                    ),
                  ),
                  SizedBox(width: 1.sw * 0.15),
                  Expanded(
                    child: MyElevatedButton(
                      text: 'Next',
                      onPressed: cubit.submitAppointment,
                    ),
                  ),
                  // MyElevatedButton(
                  //   text: 'Back',
                  //   onPressed: cubit.submitAppointment,
                  // ),
                  // MyElevatedButton(
                  //   text: 'Next',
                  //   onPressed: cubit.submitAppointment,
                  // ),
                ],
              ),

              // _buildCareTakerWithCarDriving(),
            ],
          ),
        );
      },
    );
  }

  // Column _buildCareTakerWithCarDriving() {
  //   return Column(
  //     children: [
  //       const HeaderText(text: 'Want caretaker who can drive your car?'),
  //       Row(
  //         children: [
  //           MyRadio(
  //             label: 'Yes',
  //             value: true,
  //             onChanged: onChanged,
  //           ),
  //           MyRadio(
  //             label: 'No',
  //             value: false,
  //             onChanged: onChanged,
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  // }
}
