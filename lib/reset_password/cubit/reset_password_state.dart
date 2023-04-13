// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'reset_password_cubit.dart';

/// {@template reset_password}
/// ResetPasswordState description
/// {@endtemplate}
class ResetPasswordState extends Equatable {
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final GlobalKey<FormState> formKey;

  const ResetPasswordState({
    required this.password,
    required this.confirmPassword,
    required this.formKey,
  });

  @override
  List<Object> get props => [password, confirmPassword, formKey];

  ResetPasswordState copyWith({
    TextEditingController? password,
    TextEditingController? confirmPassword,
    GlobalKey<FormState>? formKey,
  }) {
    return ResetPasswordState(
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      formKey: formKey ?? this.formKey,
    );
  }

  factory ResetPasswordState.initial() {
    return ResetPasswordState(
      formKey: GlobalKey<FormState>(),
      password: TextEditingController(),
      confirmPassword: TextEditingController(),
    );
  }
}
