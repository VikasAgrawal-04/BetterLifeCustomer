// ignore_for_file: public_member_api_docs, sort_constructors_first

part of 'register_cubit.dart';

/// {@template register}
/// RegisterState description
/// {@endtemplate}
class RegisterState extends Equatable {
  const RegisterState({
    required this.fullName,
    required this.email,
    required this.password,
    required this.confirmPassword,
    required this.mobile,
    required this.adress,
    required this.pinCode,
    required this.fathersName,
    required this.mothersName,
    required this.alternateNumber,
    required this.formKey,
  });

  final TextEditingController fullName;
  final TextEditingController email;
  final TextEditingController password;
  final TextEditingController confirmPassword;
  final TextEditingController mobile;
  final TextEditingController adress;
  final TextEditingController pinCode;
  final TextEditingController fathersName;
  final TextEditingController mothersName;
  final TextEditingController alternateNumber;

  final GlobalKey<FormState> formKey;

  // initial state with empty text controllers
  factory RegisterState.initial() {
    return RegisterState(
      fullName: TextEditingController(),
      email: TextEditingController(),
      password: TextEditingController(),
      confirmPassword: TextEditingController(),
      mobile: TextEditingController(),
      adress: TextEditingController(),
      pinCode: TextEditingController(),
      fathersName: TextEditingController(),
      mothersName: TextEditingController(),
      alternateNumber: TextEditingController(),
      formKey: GlobalKey<FormState>(),
    );
  }

  RegisterState copyWith({
    TextEditingController? fullName,
    TextEditingController? email,
    TextEditingController? password,
    TextEditingController? confirmPassword,
    TextEditingController? mobile,
    TextEditingController? adress,
    TextEditingController? pinCode,
    TextEditingController? fathersName,
    TextEditingController? mothersName,
    TextEditingController? alternateNumber,
    GlobalKey<FormState>? formKey,
  }) {
    return RegisterState(
      fullName: fullName ?? this.fullName,
      email: email ?? this.email,
      password: password ?? this.password,
      confirmPassword: confirmPassword ?? this.confirmPassword,
      mobile: mobile ?? this.mobile,
      adress: adress ?? this.adress,
      pinCode: pinCode ?? this.pinCode,
      fathersName: fathersName ?? this.fathersName,
      mothersName: mothersName ?? this.mothersName,
      alternateNumber: alternateNumber ?? this.alternateNumber,
      formKey: formKey ?? this.formKey,
    );
  }

  @override
  List<Object> get props {
    return [
      fullName,
      email,
      password,
      confirmPassword,
      mobile,
      adress,
      pinCode,
      fathersName,
      mothersName,
      alternateNumber,
      formKey,
    ];
  }
}
