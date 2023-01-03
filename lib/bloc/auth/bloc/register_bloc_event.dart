part of 'register_bloc_bloc.dart';

abstract class RegisterBlocEvent extends Equatable {
  const RegisterBlocEvent();

  @override
  List<Object> get props => [];
}

class Register extends RegisterBlocEvent {
  final User user;
  const Register({required this.user});

  @override
  List<Object> get props => [];
}
