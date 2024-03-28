import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
part 'splash_login_event.dart';
part 'splash_login_state.dart';

class SplashLoginBloc extends Bloc<SplashLoginEvent, SplashLoginState> {
  SplashLoginBloc() : super(SplashLoginInitial()) {
    on<InitialfetchEvent>(initialfetchEvent);
    on<ObscureEvent>(obscureEvent);
    on<SwitchFunction>(switchFunction);
    on<LoginToSignupEvent>(loginToSignupEvent);
    on<OtpTimerEvent>(otpTimerEvent);
    on<OtpTimerDoneEvent>(otpTimerDoneEvent);
  }

  FutureOr<void> initialfetchEvent(
      InitialfetchEvent event, Emitter<SplashLoginState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(NavigateToLogin());
  }

  FutureOr<void> obscureEvent(
      ObscureEvent event, Emitter<SplashLoginState> emit) {
    if (event.istrue == true) {
      emit(NotObscureText());
    } else {
      emit(ObscureText());
    }
  }

  FutureOr<void> switchFunction(
      SwitchFunction event, Emitter<SplashLoginState> emit) {
    if (state is SwitchON) {
      emit(SwitchOFF());
    } else {
      emit(SwitchON());
    }
  }

  FutureOr<void> loginToSignupEvent(
      LoginToSignupEvent event, Emitter<SplashLoginState> emit) {
    emit(NavigateTosignup());
  }

  FutureOr<void> otpTimerEvent(
      OtpTimerEvent event, Emitter<SplashLoginState> emit) {
    emit(OtpTimerState());
  }

  FutureOr<void> otpTimerDoneEvent(
      OtpTimerDoneEvent event, Emitter<SplashLoginState> emit) {
    emit(OtpTimerDoneState());
  }
}
