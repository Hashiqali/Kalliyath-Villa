part of 'search_bloc.dart';

@immutable
sealed class SearchState {}

final class SearchInitial extends SearchState {}

class PriceBuilderState extends SearchState {}

class CheckboxbulderclickState extends SearchState {}

class CheckboxbulderclickedState extends SearchState {}
class BhkBuilderState extends SearchState{}
class VisibleBuilderState extends SearchState{}
class NotVisibleBuilderState extends SearchState{}