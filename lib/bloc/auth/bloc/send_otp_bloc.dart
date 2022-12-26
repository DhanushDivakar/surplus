import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/repositories.dart/auth_repo.dart';

part 'send_otp_event.dart';
part 'send_otp_state.dart';
//otp bloc 
class SendOtpBloc extends Bloc<SendOtpEvent, SendOtpState> {
  final AuthRepository authRepository;
  SendOtpBloc({required this.authRepository}) : super(SendOtpInitial()) {
    on<SendOtpEvent>(_onOtpSendEvent);
  }

  FutureOr<void> _onOtpSendEvent(
      SendOtpEvent event, Emitter<SendOtpState> emit) async{
        emit(SendingOtp());
        try{
          await authRepository.sendOTP(event.phone);

          

        }catch (error){
          emit(SendOtpFailure(message: error.toString()));

        }
      }
}
