import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'cancel_event.dart';
part 'cancel_state.dart';

class CancelBloc extends Bloc<CancelEvent, CancelState> {
  CancelBloc() : super(CancelInitial()) {
    on<BookingOption1>(bookingOption1);
    on<BookingOption2>(bookingOption2);
    on<BookingOption3>(bookingOption3);
    on<BookingOption4>(bookingOption4);
    on<BookingOption5>(bookingOption5);
    on<BookingOption6>(bookingOption6);
    on<ProceedButton>(proceedButton);
    on<Userbookingbuild>(userbookingbuild);
    on<Policybuilder>(policybuilder);
  }

  FutureOr<void> bookingOption1(
      BookingOption1 event, Emitter<CancelState> emit) {
    emit(BookingOptionState1());
  }

  FutureOr<void> bookingOption2(
      BookingOption2 event, Emitter<CancelState> emit) {
    emit(BookingOptionState2());
  }

  FutureOr<void> bookingOption3(
      BookingOption3 event, Emitter<CancelState> emit) {
    emit(BookingOptionState3());
  }

  FutureOr<void> proceedButton(ProceedButton event, Emitter<CancelState> emit) {
    emit(ProceedButtonState());
  }

  FutureOr<void> bookingOption4(
      BookingOption4 event, Emitter<CancelState> emit) {
    emit(BookingOptionState4());
  }

  FutureOr<void> bookingOption5(
      BookingOption5 event, Emitter<CancelState> emit) {
    emit(BookingOptionState5());
  }

  FutureOr<void> bookingOption6(
      BookingOption6 event, Emitter<CancelState> emit) {
    emit(BookingOptionState6());
  }

  FutureOr<void> userbookingbuild(
      Userbookingbuild event, Emitter<CancelState> emit) {
    emit(UserbookingbuildState());
  }

  FutureOr<void> policybuilder(Policybuilder event, Emitter<CancelState> emit) {
    if (event.istrue == false) {
      emit(PolicybuilderState(istrue: true));
    } else {
      emit(PolicybuilderState(istrue: false));
    }
  }
}
