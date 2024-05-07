part of 'splash_login_bloc.dart';

@immutable
sealed class SplashLoginEvent {}

class InitialfetchEvent extends SplashLoginEvent {}

class ObscureEvent extends SplashLoginEvent {
 final bool? istrue;
  ObscureEvent({this.istrue});
}

class OtpTimerEvent extends SplashLoginEvent {}

class OtpTimerDoneEvent extends SplashLoginEvent {}

class SwitchFunction extends SplashLoginEvent {}

class LoginToSignupEvent extends SplashLoginEvent {}

class LoginUpdateEvent extends SplashLoginEvent {}

class LodingEvent extends SplashLoginEvent {
  final  bool? istrue;

  LodingEvent({required this.istrue});
}
