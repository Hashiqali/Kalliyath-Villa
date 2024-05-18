import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'booking_event.dart';
part 'booking_state.dart';

class BookingBloc extends Bloc<BookingEvent, BookingState> {
  BookingBloc() : super(BookingInitial()) {
    on<CalenarBuilder>(calenarBuilder);
    on<CalenardateBuilder>(calenardateBuilder);
    on<DetailsCounterBuilder>(detailsCounterBuilder);
    on<ContryCodePickerEvent>(contryCodePicker);
    on<AdresssPickerEvent>(adresssPickerEvent);
    on<BookNowLoaderEvent>(bookNowLoaderEvent);
    on<BookNowLoaderCloseEvent>(bookNowLoaderCloseEvent);
    on<BookingDateShow>(bookingDateShow);
  }

  FutureOr<void> calenarBuilder(
      CalenarBuilder event, Emitter<BookingState> emit) {
    emit(CalenarBuildeState());
  }

  FutureOr<void> calenardateBuilder(
      CalenardateBuilder event, Emitter<BookingState> emit) {
    emit(CalenardateBuilderState());
  }

  FutureOr<void> detailsCounterBuilder(
      DetailsCounterBuilder event, Emitter<BookingState> emit) {
    emit(DetailsCounterBuilderState());
  }

  FutureOr<void> contryCodePicker(
      ContryCodePickerEvent event, Emitter<BookingState> emit) {
    emit(ContryCodePickerState());
  }

  FutureOr<void> adresssPickerEvent(
      AdresssPickerEvent event, Emitter<BookingState> emit) {
    emit(AdresssPickerState());
  }

  FutureOr<void> bookNowLoaderEvent(
      BookNowLoaderEvent event, Emitter<BookingState> emit) {
    emit(BookNowLoaderOnstate());
  }

  FutureOr<void> bookNowLoaderCloseEvent(
      BookNowLoaderCloseEvent event, Emitter<BookingState> emit) {
    emit(BookNowLoaderOffstate());
  }

  FutureOr<void> bookingDateShow(
      BookingDateShow event, Emitter<BookingState> emit) {
    emit(BookingDateShowState());
  }
}
