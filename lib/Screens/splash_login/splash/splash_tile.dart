import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/login.dart';

splashTile({required Size size, required SplashLoginBloc bloc1}) {
  return BlocConsumer<SplashLoginBloc, SplashLoginState>(
    bloc: bloc1,
    listener: (context, state) {
      if (state is NavigateToLogin) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const LoginPage()));
      } else if (state is NavigateToHome) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => const ManiScreen()));
      }
    },
    builder: (context, state) {
      return Scaffold(
        body: Container(
          height: size.height,
          width: size.width,
          decoration: const BoxDecoration(color: Color.fromARGB(242, 0, 0, 0)),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Image(
                    color: Color.fromARGB(255, 255, 255, 255),
                    filterQuality: FilterQuality.high,
                    image: AssetImage('assets/images/logo.png')),
                const Text(
                  'KALLIYATH',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kalliyath2',
                      fontWeight: FontWeight.w500,
                      fontSize: 50),
                ),
                const Align(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.5,
                  widthFactor: 0,
                  child: Padding(
                    padding: EdgeInsets.only(left: 23),
                    child: Text(
                      'VILLAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kalliyath1',
                          fontWeight: FontWeight.w500,
                          fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 200,
                ),
                const Text(
                  'Experience luxury',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kalliyath2',
                      fontWeight: FontWeight.w100,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}