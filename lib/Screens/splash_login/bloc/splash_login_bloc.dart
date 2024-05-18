import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:connectivity/connectivity.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/firebase/chat_api.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
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
    on<LodingEvent>(lodingEvent);
  }

  FutureOr<void> initialfetchEvent(
      InitialfetchEvent event, Emitter<SplashLoginState> emit) async {
    await Future.delayed(const Duration(seconds: 2));
    var connectivityResult = await Connectivity().checkConnectivity();
    if (connectivityResult == ConnectivityResult.none) {
      emit(NavigateToNetworkError());
    } else {
      await initialgetfunctions();
      await Future.delayed(const Duration(seconds: 3));
      final status =
          signupDocuments.any((element) => element['status'] == true);
      if (status == true) {
        SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.remove('User');
      }
      SharedPreferences prefs = await SharedPreferences.getInstance();
      bool? istrue = prefs.getBool('User');
      if (istrue != null) {
        await userprofileUpdate();
        ChatController.updateUserData({
          'lastActive': DateTime.now(),
        });
        emit(NavigateToHome());
      } else {
        emit(NavigateToLogin());
      }
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

  FutureOr<void> lodingEvent(
      LodingEvent event, Emitter<SplashLoginState> emit) async {
    if (event.istrue == true) {
      emit(LoadingState());
    } else if (event.istrue == false) {
      emit(LoadingState());
      await Future.delayed(const Duration(seconds: 3));
      emit(SuccessState());
    }
  }
}
