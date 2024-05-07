part of 'cancel_bloc.dart';

@immutable
sealed class CancelEvent {}

class BookingOption1 extends CancelEvent {}

class BookingOption2 extends CancelEvent {}

class BookingOption3 extends CancelEvent {}

class BookingOption4 extends CancelEvent {}

class BookingOption5 extends CancelEvent {}

class BookingOption6 extends CancelEvent {}

class ProceedButton extends CancelEvent {}

class Userbookingbuild extends CancelEvent {}

class Policybuilder extends CancelEvent {
  final bool istrue;

  Policybuilder({required this.istrue});
}
