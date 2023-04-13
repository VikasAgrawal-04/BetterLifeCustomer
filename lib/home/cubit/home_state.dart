// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_cubit.dart';

/// {@template home}
/// HomeState description
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home}
  const HomeState({
    required this.tabs,
    required this.appointments,
    required this.currentIndex,
    this.status = Status.initial,
  });

  final List<String> tabs;
  final List<Appointment> appointments;
  final int currentIndex;
  final Status status;

  /// A description for customProperty

  @override
  List<Object?> get props => [tabs, appointments, currentIndex, status];

  HomeState copyWith({
    List<String>? tabs,
    List<Appointment>? appointments,
    int? currentIndex,
    Status? status,
  }) {
    return HomeState(
      tabs: tabs ?? this.tabs,
      appointments: appointments ?? this.appointments,
      currentIndex: currentIndex ?? this.currentIndex,
      status: status ?? this.status,
    );
  }
}
