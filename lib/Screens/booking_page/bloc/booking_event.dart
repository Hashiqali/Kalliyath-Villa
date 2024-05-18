part of 'booking_bloc.dart';

@immutable
sealed class BookingEvent {}

class CalenarBuilder extends BookingEvent{}
class CalenardateBuilder extends BookingEvent{}
class DetailsCounterBuilder extends BookingEvent{}
class ContryCodePickerEvent extends BookingEvent{}
class AdresssPickerEvent extends BookingEvent{}
class BookNowLoaderEvent extends BookingEvent{}
class BookNowLoaderCloseEvent extends BookingEvent{}
class BookingDateShow extends BookingEvent{}