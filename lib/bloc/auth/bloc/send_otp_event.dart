part of 'send_otp_bloc.dart';

 class SendOtpEvent extends Equatable {
  final String phone;
  const SendOtpEvent({required this.phone});

  @override
  List<Object> get props => [phone];
}
