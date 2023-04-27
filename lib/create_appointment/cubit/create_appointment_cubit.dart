import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'create_appointment_state.dart';

class CreateAppointmentCubit extends Cubit<CreateAppointmentState> {
  CreateAppointmentCubit(this.api) : super(CreateAppointmentState.initial()) {
    getPreviousCaretaker();
  }
  final ApiRepo api;

  void onPickupTimeChanged(DateTime value) {
    emit(state.copyWith(pickupTime: value));
  }

  void dateOfVisitChanged(DateTime value) {
    emit(state.copyWith(dateOfVisit: value));
  }

  void purposeOfVisitChanged(String? p1) {
    emit(state.copyWith(purposeOfVisit: p1));
  }

  void onGenderChanged(String? p1) {
    emit(state.copyWith(gender: p1));
  }

  // ignore: avoid_positional_boolean_parameters
  void onTaxiRequiredChanged(bool value) {
    emit(state.copyWith(taxiRequired: value));
  }

  void onCaretakersCountChanged(String? p1) {
    emit(state.copyWith(caretakersCount: p1));
  }

  void onCaretakerGenderChanged(String? p1) {
    emit(state.copyWith(caretakerGender: p1));
  }

  void onTaxiTypeChanged(String? p1) {
    emit(state.copyWith(taxiType: p1));
  }

  void onCareTakersLanguageChanged(String? p1) {
    emit(state.copyWith(caretakerLanguage: p1));
  }

  void onCareTakerOtherLanguageChanged(String? p1) {
    emit(state.copyWith(caretakerOtherLanguage: p1));
  }

  void onRelationsWithApplicantChange(String? p1) {
    emit(state.copyWith(relationWithApplicant: p1));
  }

  Future<void> changeStep(int i, {bool validate = true}) async {
    if (validate) {
      final isValidated = state.formKey.currentState?.validate() ?? false;
      if (!isValidated) {
        return;
      }
    }

    emit(state.copyWith(step: i));

    await state.pageController.animateToPage(
      i,
      duration: kDuration,
      curve: Curves.fastLinearToSlowEaseIn,
    );
  }

  Future<void> createNewAppointment() async {
    try {
      final visitDate = state.dateOfVisit!.add(
        Duration(
          hours: state.pickupTime!.hour,
          minutes: state.pickupTime!.minute,
          seconds: state.pickupTime!.second,
        ),
      );

      final params = CreateAppointmentParams(
        patientName: state.patientNameController.text,
        patientGender: state.gender!,
        patientRelationship: state.relationWithApplicant!,
        mobileNumber: state.mobileNumberController.text,
        noOfCaretakers: state.caretakersCount,
        caretakerGender: state.caretakerGender!,
        caretakerLanguage: state.getCaretakerLanguage(),
        taxiNeeded: state.taxiRequired,
        acTaxi: state.taxiType == 'AC',
        visitDate: visitDate,
        drivetaxi: state.caretakerWhoCanDriveCar,
        pickUpAddress: state.pickupAddressController.text,
        pickUpPinCode: state.pickupPincodeController.text,
        hospital: state.hospitalController.text,
        doctorsName: state.doctorsNameController.text,
        visitPurpose: state.purposeOfVisit!,
        apptDuration: state.appointmentDuration.text,
      );

      final result = await api.createAppointment(params);
      result.when(
        success: (value) {
          final hasCaretakers = state.previousCaretakers.isNotEmpty;
          DialogService.showDialog<void>(
            child: SuccessDialog(
              // buttonText: hasCaretakersx ? 'Select Previous Caretaker' : 'Close',
              buttonText: 'Close',
              message: value.message,
              onTap: () async {
                // if (hasCaretakers) {
                //   Get.close(2);
                //   await Get.to<void>(
                //     () => SelectPreviousCaretakerPage(
                //       caretakers: state.previousCaretakers,
                //       onProceed: (value) {},
                //       // appointmentId: value.id,
                //     ),
                //   );
                // } else {
                await api.getAppointments(type: AppointmentType.future);
                Get.close(2);
                // }
              },
            ),
          );
        },
        failure: DialogService.failure,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  Future<void> getPreviousCaretaker() async {
    try {
      emit(state.copyWith(previousCaretakersLoading: true));
      final result = await api.previousCaretaker();
      result.when(
        success: (value) {
          emit(
            state.copyWith(
              previousCaretakers: value,
              previousCaretakersLoading: false,
            ),
          );
          if (value.isEmpty) {
            changeStep(state.step + 1);
          }
        },
        failure: (e) {
          emit(
            state.copyWith(
              previousCaretakersLoading: false,
              // step: state.step + 1,
            ),
          );
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  // Future<void> getLastAppointment(int caretakerId) async {
  //   try {
  //     emit(state.copyWith(lastAppointmentLoading: true));
  //     final result = await api.getLastAppointment(caretakerId);
  //     result.when(
  //       success: (value) {
  //         emit(
  //           state.copyWith(
  //             appointmentDetails: value,
  //             lastAppointmentLoading: false,
  //           ),
  //         );
  //       },
  //       failure: (e) {},
  //     );
  //   } catch (e) {
  //     debugPrint(e.toString());
  //   }
  // }

  bool validateFields() {
    final isValidated = state.formKey.currentState?.validate() ?? false;
    if (!isValidated) {
      return false;
    }
    return true;
  }

  void validateStep1() {
    final isValidated = state.formKey.currentState?.validate() ?? false;
    if (!isValidated) {
      return;
    }

    if (state.purposeOfVisit == null) {
      DialogService.error('Please select purpose of visit');
      return;
    }

    changeStep(state.step + 1);
  }

  bool validateStep2() {
    final map = {
      state.taxiType: 'Please select Taxi type',
      state.caretakersCount: 'Please select caretakers number',
      state.caretakerLanguage: 'Please select caretaker language',
      state.caretakerGender: 'Please select caretakers gender',
      state.relationWithApplicant: 'Please select relation with applicant',
      state.gender: "Please select patient's gender",
    };

    for (final entry in map.entries) {
      if (entry.key == null) {
        DialogService.error(entry.value);
        return false;
      }
    }

    return true;
  }

  bool validateField(String? field, String errMsg) {
    if (field?.isEmpty ?? true) {
      DialogService.error(errMsg);
      return false;
    }
    return true;
  }

  Future<void> submitAppointment() async {
    try {
      if (!validateFields()) {
        return;
      }
      if (!validateStep2()) {
        return;
      }
      await createNewAppointment();
    } catch (e) {
      rethrow;
    }
  }

  // void onAppointmentDurationChanged(int? p1) {
  //   emit(state.copyWith(appointmentDuration: p1));
  // }

  void caretakerWhoCanDriveCarChanged(bool value) {
    emit(state.copyWith(caretakerWhoCanDriveCar: value));
  }

  Future<void> onPreviousCaretakerSelected(AppointmentDetails? value) async {
    emit(
      state.merge(value),
    );
    await changeStep(state.step + 1);
    // await getLastAppointment(value!);
    // await changeStep(state.step);
  }
}
