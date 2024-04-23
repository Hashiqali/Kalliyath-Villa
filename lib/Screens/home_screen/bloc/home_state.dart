part of 'home_bloc.dart';

@immutable
sealed class HomeState {}

final class HomeInitial extends HomeState {}

class HomerebuildState extends HomeState {
  final List vllaDetails;

  HomerebuildState({required this.vllaDetails});
}

class LikebuttonOffState extends HomeState {}

class LikebuttonOnState extends HomeState {}

class GridlikebuttonclikedState extends HomeState {
  final bool istrue;

  GridlikebuttonclikedState({required this.istrue});
}

class SearchGridbuilderState extends HomeState {
  final List filtereditems;

  SearchGridbuilderState({required this.filtereditems});
}

class FilterGridbuilderState extends HomeState{
final List filtereditems;

  FilterGridbuilderState({required this.filtereditems});
}
