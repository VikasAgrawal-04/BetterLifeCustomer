// ignore_for_file: public_member_api_docs, sort_constructors_first


part of 'profile_cubit.dart';

/// {@template profile}
/// ProfileState description
/// {@endtemplate}
class ProfileState extends Equatable {
  final TextEditingController name;
  final TextEditingController email;
  final TextEditingController phone;
  const ProfileState({
    required this.name,
    required this.email,
    required this.phone,
  });

  ProfileState copyWith({
    TextEditingController? name,
    TextEditingController? email,
    TextEditingController? phone,
  }) {
    return ProfileState(
      name: name ?? this.name,
      email: email ?? this.email,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [name, email, phone];

  static ProfileState initial() {
    return ProfileState(
      name: TextEditingController(),
      email: TextEditingController(),
      phone: TextEditingController(),
    );
  }

}
