import 'package:api/api.dart';
import 'package:equatable/equatable.dart';
import 'package:location/location.dart';

class LocationState extends Equatable {
  const LocationState({
    required this.currentPosition,
    required this.location,
    required this.prediction,
  });

  factory LocationState.initial() {
    return LocationState(
      currentPosition: LocationData.fromMap({}),
      location: Location(),
      prediction: const [],
    );
  }
  final LocationData currentPosition;
  final Location location;
  final List<Prediction> prediction;

  @override
  List<Object?> get props => [currentPosition, location];

  LocationState copyWith({
    LocationData? currentPosition,
    Location? location,
    List<Prediction>? prediction,
  }) {
    return LocationState(
      currentPosition: currentPosition ?? this.currentPosition,
      location: location ?? this.location,
      prediction: prediction ?? this.prediction,
    );
  }
}
