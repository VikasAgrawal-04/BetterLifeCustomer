import 'dart:async';

import 'package:api/api.dart';
import 'package:api_client/api_result/network_exceptions/network_exceptions.dart';
import 'package:better_life_customer/services/dialog_service.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:widgets/widgets/status_handler.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.api) : super(const HistoryState()) {
    getHistory();
  }
  final ApiRepo api;

  /// A description for yourCustomFunction
  FutureOr<void> getHistory() async {
    final user = api.getUser();
    emit(state.copyWith(status: Status.loading));
    // final result = await api.getTransactions(id: user!.customerId!.toString());
    // result.when(success: success, failure: failure);
  }

  Object? failure(NetworkExceptions error) {
    DialogService.failure(error);
    emit(state.copyWith(status: Status.error));
    return null;
  }

  Object? success(TransactionsResponseModel data) {
    emit(
      state.copyWith(
        status: (data.customerReward?.isEmpty ?? false)
            ? Status.empty
            : Status.success,
        transactions: data.customerReward,
      ),
    );
    return null;
  }
}
