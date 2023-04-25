import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

part 'select_previous_caretaker_state.dart';

class SelectPreviousCaretakerCubit extends Cubit<SelectPreviousCaretakerState> {
  SelectPreviousCaretakerCubit(
    // this.appointmentId,
    this.caretakers,
    this.apiRepo,
    this.onProceed,
  ) : super(const SelectPreviousCaretakerState());

  final ApiRepo apiRepo;
  // final int appointmentId;
  final List<Caretaker> caretakers;
  final ValueChanged<AppointmentDetails?> onProceed;

  Future<void> getLastAppointment(LastAppointmentParams params) async {
    try {
      final result = await apiRepo.getLastAppointment(params);
      result.when(
        success: (value) {
          onProceed.call(value);
        },
        failure: DialogService.failure,
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  /// A description for yourCustomFunction
  Future<void> selectPreviousCaretakers() async {
    // Get.back<void>();
    await getLastAppointment(
      LastAppointmentParams(
        caretakerIds: state.selectedCaretakers.toList(),
      ),
    );

    // try {
    //   if (state.selectedCaretakers == null) {
    //     DialogService.error('Please select at least one caretaker');
    //     return;
    //   }

    //   final result = await apiRepo.selectPreviousCareTakers(
    //     SelectCaretakerParams(
    //       caretakerIds: [state.selectedCaretakers!],
    //       // appointmentId: appointmentId,
    //     ),
    //   );
    //   await result.when(
    //     success: (value) async {
    //       // DialogService.success(value, onTap: () => Get.close(2));
    //       await getLastAppointment(state.selectedCaretakers!);
    //     },
    //     failure: (e) {
    //       DialogService.failure(e);
    //     },
    //   );
    // } catch (e) {
    //   debugPrint(e.toString());
    // }
  }

  void selectCaretaker(int? userid) {
    if (userid == null) return;
    final ids = {...state.selectedCaretakers};
    if (ids.contains(userid)) {
      ids.remove(userid);
    } else {
      if (ids.length >= 2) {
        DialogService.error('You can select only 2 caretakers');
        return;
      }
      ids.add(userid);
    }

    emit(state.copyWith(selectedCaretakers: ids));
  }
}
