part of 'nav_bar_bloc.dart';

@immutable
abstract class NavBarState {}

class NavBarIndexUpdated extends NavBarState {
  final int newIndex;

  NavBarIndexUpdated(this.newIndex);
}

class FirstPageLoaded extends NavBarState {
  final int newIndex;

  FirstPageLoaded(this.newIndex);
}

class SecondPageLoaded extends NavBarState {
  final int newIndex;

  SecondPageLoaded(this.newIndex);
}

class ThirdPageLoaded extends NavBarState {
  final int newIndex;

  ThirdPageLoaded(this.newIndex);
}
