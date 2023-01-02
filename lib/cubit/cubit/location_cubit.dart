import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:geolocator/geolocator.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  LocationCubit() : super(const LocationState()) {
    getLocation();
  }

  void getLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    emit(state.copyWith(isLoading: true));

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    try {
      if (!serviceEnabled) {
        emit(state.copyWith(
            isLoading: false, error: 'service is not available'));
      }
      permission = await Geolocator.checkPermission();
      if (permission == LocationPermission.denied) {
        emit(
          state.copyWith(
              isLoading: false,
              error: 'please turn on Location',
              permission: LocationPermission.denied),
        );
      } else if (permission == LocationPermission.deniedForever) {
        emit(
          state.copyWith(
              isLoading: false,
              error: 'please turn on Location',
              permission: LocationPermission.deniedForever),
        );
        await Geolocator.openLocationSettings();
      }
      Position currentPostion = await Geolocator.getCurrentPosition(
          desiredAccuracy: LocationAccuracy.high);
      emit(
        state.copyWith(
          isLoading: false,
          permission: LocationPermission.whileInUse,
          location: Location(
              latitude: currentPostion.latitude,
              longitude: currentPostion.longitude),
        ),
      );
    } catch (e) {
      emit(
        state.copyWith(isLoading: false),
      );
    }
  }
}
