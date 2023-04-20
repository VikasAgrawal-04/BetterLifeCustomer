import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:widgets/widgets.dart';

part 'select_previous_caretaker_state.dart';

class SelectPreviousCaretakerCubit extends Cubit<SelectPreviousCaretakerState> {
  SelectPreviousCaretakerCubit(
    this.appointmentId,
    this.caretakers,
    this.apiRepo,
  ) : super(const SelectPreviousCaretakerState());

  final ApiRepo apiRepo;
  final int appointmentId;
  final List<Caretaker> caretakers;

  /// A description for yourCustomFunction
  Future<void> selectPreviousCaretakers() async {
    try {
      if (state.selectedCaretakers.isEmpty) {
        DialogService.error('Please select at least one caretaker');
        return;
      }

      final result = await apiRepo.selectPreviousCareTakers(
        SelectCaretakerParams(
          caretakerIds: state.selectedCaretakers.toList(),
          appointmentId: appointmentId,
        ),
      );
      result.when(
        success: (value) {
          DialogService.success(value, onTap: () => Get.close(2));
        },
        failure: (e) {
          DialogService.failure(e);
        },
      );
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  void selectCaretaker(int? userid) {
    if (userid == null) return;
    final selected = {...state.selectedCaretakers};
    if (state.selectedCaretakers.contains(userid)) {
      selected.remove(userid);
      emit(state.copyWith(selectedCaretakers: selected));
      return;
    } else {
      selected.add(userid);
    }
    emit(state.copyWith(selectedCaretakers: selected));
  }
}
