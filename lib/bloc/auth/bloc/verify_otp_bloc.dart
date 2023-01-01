import 'dart:async';
import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/bloc/auth/bloc/authentication_bloc.dart';
import 'package:surplus/models/login_surplus.dart';
import 'package:surplus/repositories.dart/auth_repo.dart';

part 'verify_otp_event.dart';
part 'verify_otp_state.dart';

class VerifyOTPBloc extends Bloc<VerifyOTPEvent, VerifyOTPState> {
  final AuthRepository authRepository;
  final AuthenticationBloc authenticationBloc;

  VerifyOTPBloc(
      {required this.authRepository, required this.authenticationBloc})
      : super(VerifyOTPINitial()) {
    on<VerifyOTPEvent>(_onVerifyOTPEvent);
  }
//hii
  FutureOr<void> _onVerifyOTPEvent(
      VerifyOTPEvent event, Emitter<VerifyOTPState> emit) async {
    emit(VerifyingOTP());
    try {
      final response = await authRepository.verifOtp(event.phone, event.otp);
      if (response.success) {
        // final
        final login = response.data as Login;
        authenticationBloc.add(AuthAuthenticated());
        emit(VerifyOTPSuccess(login: login));
      }
    } on Exception catch (e) {}
  }
}
