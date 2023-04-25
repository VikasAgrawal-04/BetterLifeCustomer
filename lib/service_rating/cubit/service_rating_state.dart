// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'service_rating_cubit.dart';

/// {@template service_rating}
/// ServiceRatingState description
/// {@endtemplate}
class ServiceRatingState extends Equatable {
  final GlobalKey<FormState> formKey;

  final List<ServiceRatingParams> ratings;
  final List<Caretaker> caretakers;
  final int apptId;
  const ServiceRatingState({
    required this.formKey,
    required this.ratings,
    required this.caretakers,
    required this.apptId,
  });

  ServiceRatingState copyWith({
    GlobalKey<FormState>? formKey,
    List<ServiceRatingParams>? ratings,
    List<Caretaker>? caretakers,
    int? apptId,
  }) {
    return ServiceRatingState(
      formKey: formKey ?? this.formKey,
      ratings: ratings ?? this.ratings,
      caretakers: caretakers ?? this.caretakers,
      apptId: apptId ?? this.apptId,
    );
  }

  @override
  List<Object> get props => [formKey, ratings, caretakers, apptId];
}
