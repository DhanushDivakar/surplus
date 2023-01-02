import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';

class AuthenticationBloc extends Bloc<AuthenticationEvent, AuthenticationState>
    with ChangeNotifier {
  AuthenticationBloc() : super(AuthenticationState.unauthenticatd) {
    on<AuthenticationEvent>(_onAuthAuthenticated);
    on<AuthenticationEvent>(_onAuthUnAUthenticatd);
  }

  FutureOr<void> _onAuthAuthenticated(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.authenticated);
    notifyListeners();
  }

  FutureOr<void> _onAuthUnAUthenticatd(
      AuthenticationEvent event, Emitter<AuthenticationState> emit) {
    emit(AuthenticationState.unauthenticatd);
    notifyListeners();
  }

  @override
  AuthenticationState? fromJson(Map<String, dynamic> json) =>
      AuthenticationState.values[json['AuthenticationState'] as int];
  @override
  Map<String, dynamic>? toJson(AuthenticationState state) => {
        'AuthenticationState': state.index,
      };
}
