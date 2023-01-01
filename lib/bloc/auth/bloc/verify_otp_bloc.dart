import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/repositories.dart/auth_repo.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  final AuthRepository authRepository;
  VerifyOTPBloc({required this.authRepository}) : super(VerifyOTPINitial()) {
    on<VerifyOTPEvent>(_onVerifyOTPEvent);
  }
//hii 
  FutureOr<void> _onVerifyOTPEvent(
      VerifyOTPEvent event, Emitter<VerifyOTPState> emit) async {
        emit(VerifyingOTP());
        try{
          final response = await authRepository.verifOtp(event.phone, event.otp);
          if(response.success){
           // final 
          }
        }on Exception catch (e){

        }
      }
}
