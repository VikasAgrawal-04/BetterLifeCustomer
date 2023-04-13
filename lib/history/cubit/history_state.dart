// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'history_cubit.dart';

/// {@template history}
/// HistoryState description
/// {@endtemplate}
class HistoryState extends Equatable {
  /// {@macro history}
  ///
  ///
  ///
  final List<CustomerReward> transactions;
  final Status status;

  const HistoryState({
    this.transactions = const [],
    this.status = Status.initial,
  });

  @override
  List<Object> get props => [status, transactions];

  HistoryState copyWith({
    List<CustomerReward>? transactions,
    Status? status,
  }) {
    return HistoryState(
      transactions: transactions ?? this.transactions,
      status: status ?? this.status,
    );
  }
}
