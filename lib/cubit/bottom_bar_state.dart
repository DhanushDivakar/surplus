part of 'bottom_bar_cubit.dart';

 class BottomBarState extends Equatable {
  final NavbarItem navbarItem;
  final int index;
  const BottomBarState(this.navbarItem, this.index);

  @override
  List<Object> get props => [navbarItem, index];
}

enum NavbarItem { home, add, chat, profile }
