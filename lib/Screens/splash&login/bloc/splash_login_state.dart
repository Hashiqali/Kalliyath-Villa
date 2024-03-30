part of 'splash_login_bloc.dart';

@immutable
sealed class SplashLoginState {}

abstract class ActionState extends SplashLoginState {}

final class SplashLoginInitial extends SplashLoginState {}

class NavigateToLogin extends ActionState {}

class NavigateToHome extends ActionState {}

class NavigateTosignup extends ActionState {}

class ObscureText extends SplashLoginState {}

class NotObscureText extends SplashLoginState {}

class SwitchON extends SplashLoginState {}

class SwitchOFF extends SplashLoginState {}

class OtpTimerState extends SplashLoginState {}

class OtpTimerDoneState extends SplashLoginState {}

class LoginUpdatestate extends SplashLoginState {}
