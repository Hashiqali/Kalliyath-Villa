part of 'password_bloc.dart';

@immutable
sealed class PasswordState {}

final class PasswordInitial extends PasswordState {}

class OldpassEventState extends PasswordState {
  final bool istrue;

  OldpassEventState({required this.istrue});
}

class NewpassEventState extends PasswordState {
  final bool istrue;

  NewpassEventState({required this.istrue});
}

class NewConfirmpassEventState extends PasswordState {
  final bool istrue;

  NewConfirmpassEventState({required this.istrue});
}
