part of 'details_data_bloc.dart';

class DetailsDataState extends Equatable {
  final User user;
  const DetailsDataState({required this.user});

  DetailsDataState.empty() : user = User();

  factory DetailsDataState.fromJson(Map<String, dynamic> json) =>
      DetailsDataState(
        user: User.fromJson(json['user'] as Map<String, dynamic>),
      );

  Map<String, dynamic> toJson() => {
        'user': user,
      };
  DetailsDataState copyWith({User? user}) {
    return DetailsDataState(user: user ?? this.user);
  }

  @override
  List<Object> get props => [user];
}
