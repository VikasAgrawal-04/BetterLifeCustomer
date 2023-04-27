// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'forgot_password_cubit.dart';

class ForgotPasswordState extends Equatable {
  const ForgotPasswordState({
    required this.formKey,
    required this.phone,
  });

  final GlobalKey<FormState> formKey;
  final TextEditingController phone;

  ForgotPasswordState copyWith({
    GlobalKey<FormState>? formKey,
    TextEditingController? phone,
  }) {
    return ForgotPasswordState(
      formKey: formKey ?? this.formKey,
      phone: phone ?? this.phone,
    );
  }

  @override
  List<Object> get props => [formKey, phone];
}
