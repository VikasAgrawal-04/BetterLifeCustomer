// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'select_previous_caretaker_cubit.dart';

/// {@template select_previous_caretaker}
/// SelectPreviousCaretakerState description
/// {@endtemplate}
class SelectPreviousCaretakerState extends Equatable {
  /// {@macro select_previous_caretaker}
  const SelectPreviousCaretakerState({
    this.selectedCaretakers = const {},
  });

  final Set<int> selectedCaretakers;

  @override
  List<Object> get props => [selectedCaretakers];

  SelectPreviousCaretakerState copyWith({
    Set<int>? selectedCaretakers,
  }) {
    return SelectPreviousCaretakerState(
      selectedCaretakers: selectedCaretakers ?? this.selectedCaretakers,
    );
  }
}
