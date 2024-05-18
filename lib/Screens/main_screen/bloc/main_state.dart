part of 'main_bloc.dart';

@immutable
sealed class MainState {}

final class MainInitial extends MainState {}
class NavigationbarBuilderState extends MainState {}
class NavigationOnOffState extends MainState {}