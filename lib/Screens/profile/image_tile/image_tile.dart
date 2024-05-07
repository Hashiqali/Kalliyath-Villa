import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

imageTile({required Size size}) {
  return PreferredSize(
      preferredSize: Size(size.width, size.height / 3.9),
      child: BlocBuilder<SplashLoginBloc, SplashLoginState>(
        bloc: bloc1,
        builder: (context, state) {
          return Container(
            color: const Color.fromARGB(255, 39, 39, 39),
            child: Padding(
              padding: const EdgeInsets.only(top: 30),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: CachedNetworkImage(
                      height: 100,
                      fit: BoxFit.cover,
                      width: 100,
                      imageUrl: userData['Image'],
                      placeholder: (context, url) =>
                          const CircularProgressIndicator(
                        color: AppColors.white,
                      ),
                      errorWidget: (context, url, error) => const CircleAvatar(
                        backgroundColor: Color.fromARGB(255, 39, 39, 39),
                        backgroundImage:
                            AssetImage('assets/images/user (1).png'),
                        radius: 47,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 5),
                    child: Text(userData['Username'],
                        style: apptextstyle(color: AppColors.white, size: 20)),
                  ),
                ],
              ),
            ),
          );
        },
      ));
}
