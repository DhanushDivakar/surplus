part of 'user_bloc.dart';

class UserState extends Equatable {
  final User user;
  const UserState({required this.user});

  factory UserState.fromJson(Map<String, dynamic> json) {
    return UserState(
      user: User.fromJson(json['user'] ?? {}),
    );
  }

  /// empty is used to create the empty UserState

  factory UserState.empty() {
    return UserState(
      user: User(),
    );
  }

  Map<String, dynamic> toJson() => {'user': user.toJson()};

  UserState copyWith({
    User? user,
  }) {
    return UserState(user: user ?? this.user);
  }

  @override
  List<Object> get props => [user];
}
