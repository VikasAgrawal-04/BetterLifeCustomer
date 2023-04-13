// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class OtpState extends Equatable {
  final bool isLoading;
  // final bool isTimeout;
  final bool showCountdown;
  final String? error;
  // final String otp;
  final TextEditingController otp;

  const OtpState({
    required this.otp,
    this.isLoading = false,
    this.showCountdown = true,
    this.error,
  });

  OtpState copyWith({
    bool? isLoading,
    bool? showCountdown,
    String? error,
    TextEditingController? otp,
  }) {
    return OtpState(
      isLoading: isLoading ?? this.isLoading,
      showCountdown: showCountdown ?? this.showCountdown,
      error: error ?? this.error,
      otp: otp ?? this.otp,
    );
  }

  @override
  List<Object?> get props => [
        isLoading,
        showCountdown,
        error,
        otp,
      ];
}
