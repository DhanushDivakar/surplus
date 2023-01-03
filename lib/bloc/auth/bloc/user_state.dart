part of 'user_bloc.dart';

class UserState extends Equatable {
  final Login login;
  const UserState({required this.login});

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(login: Login.fromJson(json['login'] ?? {}));
  }

  factory UserState.empty() {
    return UserState(login: Login());
  }

  Map<String, dynamic> toJson() => {'login': login.toJson()};

  UserState copyWith({
    Login? login,
  }) {
    return UserState(login: login ?? this.login);
  }

  @override
  List<Object> get props => [login];
}
