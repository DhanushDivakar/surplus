part of 'details_data_bloc.dart';

abstract class DetailsDataEvent extends Equatable {
  const DetailsDataEvent();

  @override
  List<Object> get props => [];
}

class UpdateUserDetails extends DetailsDataEvent {
  final User user;
  const UpdateUserDetails({required this.user});
  @override
  List<Object> get props => [user];
}


class SubmitDetailsEvent extends DetailsDataEvent{
  final User user;
  const SubmitDetailsEvent({required this.user});
   @override
  List<Object> get props => [user];

}
