part of 'send_otp_bloc.dart';

abstract class SendOtpState extends Equatable {
  const SendOtpState();

  @override
  List<Object> get props => [];
}

class SendOtpInitial extends SendOtpState {}

class SendingOtp extends SendOtpState {}

class SendOtpSuccess extends SendOtpState {}

class SendOtpFailure extends SendOtpState {
  final String message;
  const SendOtpFailure({required this.message});

  @override
  List<Object> get props => [message];
}
