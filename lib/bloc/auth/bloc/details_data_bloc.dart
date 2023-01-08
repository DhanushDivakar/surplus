import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:surplus/bloc/auth/bloc/register_bloc_bloc.dart';

import '../../../models/user_model.dart';

part 'details_data_event.dart';
part 'details_data_state.dart';

class DetailsDataBloc extends Bloc<DetailsDataEvent, DetailsDataState> {
  final RegisterBlocBloc registerBlocBloc;
  DetailsDataBloc({required this.registerBlocBloc})
      : super(DetailsDataState.empty()) {
    on<DetailsDataEvent>((event, emit) {
      
      on<SubmitDetailsEvent>(_onSubmitUserDEtails);
    });
  }

  @override
  DetailsDataState? fromJson(Map<String, dynamic> json) =>
      DetailsDataState.fromJson(json);

  @override
  Map<String, dynamic>? toJson(DetailsDataState state) => state.toJson();

 //this is details bloc

  FutureOr<void> _onSubmitUserDEtails(
      SubmitDetailsEvent event, Emitter<DetailsDataState> emit) {
    emit(DetailsDataState(user: event.user));
    registerBlocBloc.add(
      Register(user: state.user),
    );
  }
}
