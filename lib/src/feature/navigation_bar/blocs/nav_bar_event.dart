part of 'nav_bar_bloc.dart';

@immutable
abstract class NavBarEvent {}

class AppStarted extends NavBarEvent{
}

class PageTapped extends NavBarEvent{
  final int index;

  PageTapped(this.index);
}