part of 'authentication_bloc.dart';

abstract class AuthenticationEvent extends Equatable {
  const AuthenticationEvent();

  @override
  List<Object> get props => [];
}


class AuthAuthenticated extends AuthenticationEvent{}

class AuthUnAuthenticated extends AuthenticationEvent{}