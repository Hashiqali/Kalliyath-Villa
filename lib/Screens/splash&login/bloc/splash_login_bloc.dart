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
  }

  FutureOr<void> initialfetchEvent(
      InitialfetchEvent event, Emitter<SplashLoginState> emit) async {
    await Future.delayed(const Duration(seconds: 3));
    emit(NavigateToLogin());
  }

  FutureOr<void> obscureEvent(
      ObscureEvent event, Emitter<SplashLoginState> emit) {
    if (state is ObscureText) {
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
}
