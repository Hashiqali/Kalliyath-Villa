
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/form_tile/form_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/signup/signup.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

loginTile(
    {required Size size,
    required SplashLoginBloc bloc1,
    required loginkey,
    required TextEditingController passwordcontroller,
    required TextEditingController phonenumbercontroller}) {
  return BlocConsumer<SplashLoginBloc, SplashLoginState>(
    bloc: bloc1,
    listener: (context, state) {
      if (state is NavigateTosignup) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => SignupPage()));
      }
    },
    builder: (context, state) {
      return Scaffold(
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    colorFilter: ColorFilter.mode(
                      AppColors.black.withOpacity(0.20),
                      BlendMode.saturation,
                    ),
                    image: const AssetImage(
                        'assets/images/Modern House Design.jpeg'))),
            child: SafeArea(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                   Text(
                    'Login',
                    style: apptextstyle(color: AppColors.white, size: 35,family: 'Kalliyath1')
                    
                  ),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  formTile(
                      context: context,
                      key: loginkey,
                      password: passwordcontroller,
                      size: size,
                      phonenumber: phonenumbercontroller),
                  SizedBox(
                    height: size.height / 50,
                  ),
                  GestureDetector(
                    onTap: () {
                      bloc1.add(LoginToSignupEvent());
                    },
                    child: const Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Don\'t have an account? ',
                              style: TextStyle(
                                  color: AppColors.white,
                                  fontFamily: 'Kalliyath1',
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              'Signup',
                              style: TextStyle(
                                  color:AppColors.lightgreen,
                                  fontFamily: 'Kalliyath1',
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    },
  );
}
