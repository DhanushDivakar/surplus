class Login {
  Login({this.accessToken});
  String? accessToken;

  factory Login.fromJson(Map<String, dynamic> json) =>
      Login(accessToken: json['access_token']);

  Map<String, dynamic> toJson() => {
        'access_token': accessToken,
      };

  Login copyWith({
    String? accessToken,
  }) =>
      Login(accessToken: accessToken ?? this.accessToken);
}
