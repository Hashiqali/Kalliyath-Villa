part of 'main_bloc.dart';

@immutable
sealed class MainEvent {}


class NavigationbarBuilder extends MainEvent{}
class NavigationOnOff extends MainEvent{}