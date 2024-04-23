part of 'search_bloc.dart';

@immutable
sealed class SearchEvent {}

class PriceBuilder extends SearchEvent {}

class Checkboxbulder extends SearchEvent {
  final bool istrue;

  Checkboxbulder({required this.istrue});
}

class BhkBuilder extends SearchEvent {}
class VisibleBuilder extends SearchEvent {}
class NotVisibleBuilder extends SearchEvent {}