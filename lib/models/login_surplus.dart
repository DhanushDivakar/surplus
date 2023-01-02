import 'package:surplus/models/user_model.dart';

class Login {
  Login({this.accessToken, this.user});
  String? accessToken;
  User? user;

  factory Login.fromJson(Map<String, dynamic> json) => Login(
      accessToken: json['access_token'],
      user: User.fromJson(json['user'] ?? {}));

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
        'user': user?.toJson(),
      };

  Login copyWith({
    String? accessToken,
    User? user,
  }) =>
      Login(
        accessToken: accessToken ?? this.accessToken,
        user: user ?? this.user,
      );
}
