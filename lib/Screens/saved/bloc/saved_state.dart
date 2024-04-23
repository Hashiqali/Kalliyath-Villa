part of 'saved_bloc.dart';

@immutable
sealed class SavedState {}

final class SavedInitial extends SavedState {}

class SavedbuildState extends SavedState {
  final List saveddetails;

  SavedbuildState({required this.saveddetails});
}
