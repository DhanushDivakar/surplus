part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;
  const UserState({required this.user});

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  factory UserState.empty() {
    return UserState(
      user: User(),
    );
  }

  @override
  List<Object> get props => [];
}
