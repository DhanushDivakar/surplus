import 'dart:async';
import 'dart:ffi';
import 'dart:io';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/bloc/auth/bloc/user_bloc.dart';
import 'package:surplus/models/login_surplus.dart';
import 'package:surplus/repositories.dart/auth_repo.dart';

import '../../../models/user_model.dart';

part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBlocBloc extends Bloc<RegisterBlocEvent, RegisterBlocState> {
  final AuthRepository authRepository;
  final UserBloc userBloc;

  RegisterBlocBloc({required this.authRepository, required this.userBloc})
      : super(RegisterBlocInitial()) {
    on<Register>(_onRegister);
  }

  FutureOr<void> _onRegister(
      Register event, Emitter<RegisterBlocState> emit) async {
    emit(Registering());
    try {
      final response = await authRepository.register(event.user);
      if (response.success) {
        final login = response.data as Login;
        userBloc.add(UpdateUserDetails(login: login));

        emit(
          Registerd(),
        );
      } else {
        emit(RegisterFailed(message: response.message));
      }
    } on Exception catch (e) {
      emit(RegisterFailed(message: 'Error: $e'));
    }
  }
}
