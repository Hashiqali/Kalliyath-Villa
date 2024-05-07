
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/forgot_password/password_page/passwordTile/password_tile.dart';

class ChangePasswordTile extends StatelessWidget {
  ChangePasswordTile({super.key, required this.phoneNumber});

  final GlobalKey<FormState> changePasskey = GlobalKey<FormState>();
  final String phoneNumber;
  final TextEditingController newpasscontroller = TextEditingController();
  final TextEditingController newRepasscontroller = TextEditingController();
  final SplashLoginBloc blocp = SplashLoginBloc();
  final SplashLoginBloc blocp1 = SplashLoginBloc();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: passwordTile(
            size: size,
            changePasskey: changePasskey,
            context: context,
            blocp1: blocp1,
            blocp: blocp,
            newpasscontroller: newpasscontroller,
            newRepasscontroller: newRepasscontroller,
            phoneNumber: phoneNumber));
  }
}
