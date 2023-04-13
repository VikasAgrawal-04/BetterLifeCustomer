// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'login_cubit.dart';

/// {@template login}
/// LoginState description
/// {@endtemplate}
class LoginState extends Equatable {
  /// {@macro login}
  const LoginState({
    required this.mobile,
    required this.password,
    required this.locationName,
    required this.formKey,
  });

  final TextEditingController mobile;

  final TextEditingController password;
  final TextEditingController locationName;
  final GlobalKey<FormState> formKey;

  @override
  List<Object> get props => [mobile, password, formKey];

  /// Creates a copy of the current LoginState with property changes
  LoginState copyWith({
    TextEditingController? mobile,
    TextEditingController? password,
    TextEditingController? locationName,
    GlobalKey<FormState>? formKey,
  }) {
    return LoginState(
      mobile: mobile ?? this.mobile,
      password: password ?? this.password,
      locationName: locationName ?? this.locationName,
      formKey: formKey ?? this.formKey,
    );
  }

  // initial state with empty text controllers
  factory LoginState.initial() {
    return LoginState(
      locationName: TextEditingController(),
      mobile: TextEditingController(),
      password: TextEditingController(),
      formKey: GlobalKey<FormState>(),
    );
  }
}
