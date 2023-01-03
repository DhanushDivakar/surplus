part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserDetails extends UserEvent {
  final Login login;
  const UpdateUserDetails({required this.login});

  @override
  List<Object> get props => [login];
}

class DeleteUserDetails extends UserEvent {
  const DeleteUserDetails();
}
