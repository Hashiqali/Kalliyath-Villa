import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/login.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/widget/no_network_widget/no_network_widget.dart';

splashTile({required Size size, required SplashLoginBloc bloc1}) {
  return BlocConsumer<SplashLoginBloc, SplashLoginState>(
    bloc: bloc1,
    listener: (context, state) {
      if (state is NavigateToNetworkError) {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (ctx) => NoNetworkWidget()));
      } else if (state is NavigateToLogin) {
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
          decoration: const BoxDecoration(color: AppColors.black),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(
                  height: size.height / 2.5,
                ),
                Text(
                  'KALLIYATH',
                  style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kalliyath3',
                      fontWeight: FontWeight.w500,
                      fontSize: size.width / 7.5),
                ),
                Align(
                  alignment: Alignment.bottomLeft,
                  heightFactor: 0.5,
                  widthFactor: .0,
                  child: Padding(
                    padding: const EdgeInsets.only(
                      left: 23,
                    ),
                    child: Text(
                      'VILLAS',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kalliyath2',
                          fontWeight: FontWeight.w600,
                          fontSize: size.width / 11.4),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height / 3.5,
                ),
                Align(
                  alignment: Alignment.bottomCenter,
                  child: Column(
                    children: [
                      SizedBox(
                          height: size.width / 10,
                          width: size.width / 10,
                          child: const CircularProgressIndicator(
                            color: AppColors.white,
                          )),
                      Padding(
                        padding: const EdgeInsets.only(top: 20),
                        child: Text(
                          'Experience luxury',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kalliyath2',
                              fontWeight: FontWeight.w100,
                              fontSize: size.width / 32),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      );
    },
  );
}
