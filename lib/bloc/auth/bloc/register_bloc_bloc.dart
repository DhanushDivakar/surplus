import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:surplus/models/login_surplus.dart';
import 'package:surplus/repositories.dart/auth_repo.dart';

import '../../../models/user_model.dart';

part 'register_bloc_event.dart';
part 'register_bloc_state.dart';

class RegisterBlocBloc extends Bloc<RegisterBlocEvent, RegisterBlocState> {
  final AuthRepository authRepository;

  RegisterBlocBloc({required this.authRepository})
      : super(RegisterBlocInitial()) {
    on<RegisterBlocEvent>(_onRegister);
  }

  FutureOr<void> _onRegister(
      RegisterBlocEvent event, Emitter<RegisterBlocState> emit) async {
    // emit(Registering());
    // try {
    //   final response = await authRepository.register(event.);
    //   if (response.success) {
    //     final login = response.data as Login;
    //     emit(Registerd());
    //   } else {
    //     emit(RegisterFailed(message: response.message));
    //   }
    // } on Exception catch (e) {
    //   emit(RegisterFailed(message: 'Error: $e'));
    // }
  }
}
