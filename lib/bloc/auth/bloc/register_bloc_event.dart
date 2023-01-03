part of 'register_bloc_bloc.dart';

abstract class RegisterBlocEvent extends Equatable {
  const RegisterBlocEvent();

  @override
  List<Object> get props => [];
}

class Register extends RegisterBlocEvent {
  const Register(
      {required this.profilePic,
      required this.aadharNo,
      required this.aadharPic,
      required this.email,
      required this.name,
      required this.lat,
      required this.long});
  final File profilePic;
  final String name;
  final String email;
  final String aadharNo;
  final File aadharPic;
  final String lat;
  final String long;

  @override
  List<Object> get props =>
      [profilePic, name, email, aadharNo, aadharPic, lat, long];
}
