part of 'cancel_bloc.dart';

@immutable
sealed class CancelState {}

final class CancelInitial extends CancelState {}

final class ProfileInitial extends CancelState {}

class BookingOptionState1 extends CancelState {}

class BookingOptionState2 extends CancelState {}

class BookingOptionState3 extends CancelState {}

class BookingOptionState4 extends CancelState {}

class BookingOptionState5 extends CancelState {}

class BookingOptionState6 extends CancelState {}

class ProceedButtonState extends CancelState {}

class UserbookingbuildState extends CancelState {}

class PolicybuilderState extends CancelState {
  final bool istrue;

  PolicybuilderState({required this.istrue});
}
