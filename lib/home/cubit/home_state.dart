// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'home_cubit.dart';

/// {@template home}
/// HomeState description
/// {@endtemplate}
class HomeState extends Equatable {
  /// {@macro home}
  const HomeState(
      {required this.tabs,
      required this.appointments,
      required this.currentIndex,
      required this.polylineCoordinates,
      this.careLocation,
      this.status = Status.initial,
      this.hosLat,
      this.hosLong,
      this.careIcon = BitmapDescriptor.defaultMarker});

  final List<String> tabs;
  final List<Appointment> appointments;
  final int currentIndex;
  final Status status;
  final CareLocation? careLocation;
  final List<LatLng> polylineCoordinates;
  final double? hosLat;
  final double? hosLong;
  final BitmapDescriptor careIcon;

  /// A description for customProperty

  @override
  List<Object?> get props => [
        tabs,
        appointments,
        currentIndex,
        status,
        careLocation,
        hosLat,
        hosLong,
        polylineCoordinates,
        careIcon
      ];

  HomeState copyWith(
      {List<String>? tabs,
      List<Appointment>? appointments,
      int? currentIndex,
      Status? status,
      CareLocation? careLocation,
      List<LatLng>? polylineCoordinates,
      double? hosLat,
      double? hosLong,
      BitmapDescriptor? careIcon}) {
    return HomeState(
        careIcon: careIcon ?? this.careIcon,
        hosLat: hosLat ?? this.hosLat,
        hosLong: hosLong ?? this.hosLong,
        tabs: tabs ?? this.tabs,
        appointments: appointments ?? this.appointments,
        currentIndex: currentIndex ?? this.currentIndex,
        status: status ?? this.status,
        careLocation: careLocation ?? this.careLocation,
        polylineCoordinates: polylineCoordinates ?? this.polylineCoordinates);
  }
}
