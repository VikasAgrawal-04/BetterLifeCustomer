import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class LocationState extends Equatable {
  const LocationState({
    required this.currentPosition,
    required this.location,
  });

  factory LocationState.initial() {
    return LocationState(
      currentPosition: LocationData.fromMap({}),
      location: Location(),
    );
  }
  final LocationData currentPosition;
  final Location location;

  @override
  List<Object?> get props => [currentPosition, location];

  LocationState copyWith({
    LocationData? currentPosition,
    Location? location,
  }) {
    return LocationState(
      currentPosition: currentPosition ?? this.currentPosition,
      location: location ?? this.location,
    );
  }
}
