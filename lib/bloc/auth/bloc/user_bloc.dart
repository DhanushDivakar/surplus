import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../../models/login_surplus.dart';

part 'user_event.dart';
part 'user_state.dart';

class UserBloc extends Bloc<UserEvent, UserState> {
  UserBloc() : super(UserState.empty()) {
    on<UpdateUserDetails>(_onUpdateUserDetails);
    on<DeleteUserDetails>(_onDeleteUserDetails);
  }

  @override
  UserState? fromJson(Map<String, dynamic> json) => UserState.fromJson(json);

  @override
  Map<String, dynamic> toJson(UserState state) => state.toJson();

  FutureOr<void> _onDeleteUserDetails(
      DeleteUserDetails event, Emitter<UserState> emit) {
    emit(UserState.empty());
  }

  FutureOr<void> _onUpdateUserDetails(
      UpdateUserDetails event, Emitter<UserState> emit) {
    emit(state.copyWith(login: event.login));
  }
}
