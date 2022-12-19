import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_bar_state.dart';

class BottomBarCubit extends Cubit<BottomBarState> {
  BottomBarCubit() : super(const BottomBarState(NavbarItem.home, 0));

  void getBottomBarItem(NavbarItem navbarItem) {
    switch (navbarItem) {
      case NavbarItem.home:
        emit(
          const BottomBarState(NavbarItem.home, 0),
        );
        break;
      case NavbarItem.add:
        emit(
          const BottomBarState(NavbarItem.add, 1),
        );
        break;

      case NavbarItem.chat:
        emit(
          const BottomBarState(NavbarItem.chat, 2),
        );
        break;
      case NavbarItem.profile:
        emit(
          const BottomBarState(NavbarItem.profile, 3),
        );
        break;
    }
  }
}
