import 'dart:async';

import 'package:api/api.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:widgets/widgets.dart';

part 'service_rating_state.dart';

class ServiceRatingCubit extends Cubit<ServiceRatingState> {
  ServiceRatingCubit({
    required this.api,
    required int apptId,
    required List<Caretaker> caretakers,
  }) : super(
          ServiceRatingState(
            formKey: GlobalKey<FormState>(),
            apptId: apptId,
            ratings: const [],
            caretakers: caretakers,
          ),
        );
  final ApiRepo api;

  Future<void> submitRatings() async {
    if (!(state.formKey.currentState?.validate() ?? false)) {
      return;
    }

    if (state.ratings.isEmpty) {
      DialogService.error('Please select rating');
      return;
    }

    var success = false;
    for (final element in state.ratings) {
      final result = await api.serviceRating(params: element);
      result.when(
        success: (data) {
          success = true;
        },
        failure: (error) {
          success = false;
          return;
        },
      );
    }

    if (success) {
      DialogService.success(
        'Ratings submitted successfully',
        onTap: () async {
          await api.getAppointments(type: AppointmentType.past);
          Get.close(2);
        },
      );
    } else {
      DialogService.error('Failed to submit ratings');
    }
  }

  void onRatingChanged(ServiceRatingParams value) {
    final ratings = [...state.ratings];
    final index = state.ratings
        .indexWhere((element) => element.caretakerId == value.caretakerId);
    if (index == -1) {
      ratings.add(value);
    } else {
      ratings[index] = value;
    }
    emit(state.copyWith(ratings: ratings));
  }
}
