part of 'home_bloc.dart';

@immutable
sealed class HomeEvent {}

class Homerebuild extends HomeEvent {}

class Likebutton extends HomeEvent {
  final bool istrue;

  Likebutton({required this.istrue});
}

class Gridbuilder extends HomeEvent {}

class Gridlikebutton extends HomeEvent {
  final bool istrue;

  Gridlikebutton({required this.istrue});
}

class SearchGridbuilder extends HomeEvent {
  final List filtereditems;

  SearchGridbuilder({required this.filtereditems});
}

class FilterGridbuilder extends HomeEvent {
  final List filtereditems;

  FilterGridbuilder({required this.filtereditems});
}
