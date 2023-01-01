part of 'register_bloc_bloc.dart';

abstract class RegisterBlocState extends Equatable {
  const RegisterBlocState();
  
  @override
  List<Object> get props => [];
}

class RegisterBlocInitial extends RegisterBlocState {}

class Registering extends RegisterBlocState{}

class Registerd extends RegisterBlocState{}


class RegisterFailed extends RegisterBlocState{
  const RegisterFailed({required this.message});
  final String message;

  @override
  List<Object> get props => [message];


}
