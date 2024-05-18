part of 'booking_bloc.dart';

@immutable
sealed class BookingState {}

final class BookingInitial extends BookingState {}
class CalenarBuildeState extends BookingState{}
class CalenardateBuilderState extends BookingState {}
class DetailsCounterBuilderState extends BookingState{}
class ContryCodePickerState extends BookingState{}
class AdresssPickerState extends BookingState{}
class BookNowLoaderOnstate extends BookingState {}
class BookNowLoaderOffstate extends BookingState {}
class BookingDateShowState extends BookingState {}