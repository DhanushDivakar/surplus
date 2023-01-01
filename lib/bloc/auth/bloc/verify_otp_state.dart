part of 'verify_otp_bloc.dart';

abstract class VerifyOTPState extends Equatable {
  const VerifyOTPState();

  @override
  List<Object> get props => [];
}

class VerifyOTPINitial extends VerifyOTPState {}

class VerifyingOTP extends VerifyOTPState {}

class VerifyOTPSuccess extends VerifyOTPState {}

class VeriOTPFailure extends VerifyOTPState {
  const VeriOTPFailure({required this.message});
  final String message;
  @override
  List<Object> get props => [message];
}
