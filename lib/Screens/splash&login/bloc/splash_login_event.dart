part of 'splash_login_bloc.dart';

@immutable
sealed class SplashLoginEvent {}

class InitialfetchEvent extends SplashLoginEvent {}

class ObscureEvent extends SplashLoginEvent {
  bool istrue;
  ObscureEvent({required this.istrue});
}

class OtpTimerEvent extends SplashLoginEvent {}

class OtpTimerDoneEvent extends SplashLoginEvent {}

class SwitchFunction extends SplashLoginEvent {}

class LoginToSignupEvent extends SplashLoginEvent {}
