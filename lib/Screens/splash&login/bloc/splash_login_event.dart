part of 'splash_login_bloc.dart';

@immutable
sealed class SplashLoginEvent {}

class InitialfetchEvent extends SplashLoginEvent {
   
}

class ObscureEvent extends SplashLoginEvent{}

class SwitchFunction extends SplashLoginEvent{}