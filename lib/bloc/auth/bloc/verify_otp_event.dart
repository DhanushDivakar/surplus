part of 'verify_otp_bloc.dart';

class VerifyOTPEvent extends Equatable {
  const VerifyOTPEvent({required this.otp, required this.phone});
  final String otp;
  final String phone;
  @override
  List<Object?> get props => [otp, phone];
}
