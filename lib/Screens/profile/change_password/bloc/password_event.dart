part of 'password_bloc.dart';

@immutable
sealed class PasswordEvent {}

class OldpassEvent extends PasswordEvent {
  final bool istrue;

  OldpassEvent({required this.istrue});
}

class NewpassEvent extends PasswordEvent {
  final bool istrue;

  NewpassEvent({required this.istrue});
}

class NewConfirmpassEvent extends PasswordEvent {
  final bool istrue;

  NewConfirmpassEvent({required this.istrue});
}
