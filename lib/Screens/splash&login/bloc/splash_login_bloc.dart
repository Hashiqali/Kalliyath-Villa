import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/functions.dart';
import 'package:shared_preferences/shared_preferences.dart';
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
    on<LoginUpdateEvent>(loginUpdateEvent);
  }

  FutureOr<void> initialfetchEvent(
      InitialfetchEvent event, Emitter<SplashLoginState> emit) async {
    await getAllDocuments();
    await Future.delayed(const Duration(seconds: 3));
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool? istrue = prefs.getBool('User');
    if (istrue != null) {
      userprofileUpdate();
      emit(NavigateToHome());
    } else {
      emit(NavigateToLogin());
    }
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

  FutureOr<void> loginUpdateEvent(
      LoginUpdateEvent event, Emitter<SplashLoginState> emit) {
    emit(LoginUpdatestate());
  }
}
