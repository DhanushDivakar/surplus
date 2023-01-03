part of 'user_bloc.dart';

abstract class UserEvent extends Equatable {
  const UserEvent();

  @override
  List<Object> get props => [];
}


// class UserDetails extends UserEvent{
//   const UserDetails({required this.user})
//   final User user;
  
//   @override
//   List<Object> get props => [user];


// }
