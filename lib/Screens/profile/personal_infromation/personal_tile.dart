import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/change_password.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/Screens/profile/personal_infromation/functions.dart';
import 'package:kalliyath_villa/Screens/profile/personal_infromation/personal_form_tile/personal_form_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

personalTile(
    {required Size size,
    required TextEditingController namecontroller,
    required TextEditingController addresscontroller,
    required String selectedGender,
    required List genders,
    required SplashLoginBloc loadingbutton}) {
  return Container(
    height: size.height,
    width: size.width,
    color: AppColors.black,
    child: SingleChildScrollView(
      child: Column(
        children: [
          BlocBuilder<SplashLoginBloc, SplashLoginState>(
            bloc: bloc1,
            builder: (context, state) {
              return Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    personalformTile(
                        size: size,
                        context: context,
                        namecontroller: namecontroller,
                        addresscontroller: addresscontroller,
                        selectedGender: selectedGender,
                        genders: genders),
                    BlocBuilder<SplashLoginBloc, SplashLoginState>(
                      bloc: loadingbutton,
                      builder: (context, state) {
                        bool loading = false;

                        if (state is LoadingState) {
                          loading = true;
                        } else if (state is SuccessState) {
                          loading = false;
                        }
                        return GestureDetector(
                          onTap: () {
                            if (buttoncolor) {
                              if (!loading) {
                                loadingbutton.add(LodingEvent(istrue: true));
                                updatebutton(
                                    address: addresscontroller.text.trim(),
                                    gender: selectedGender,
                                    name: namecontroller.text.trim(),
                                    context: context);
                              }
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 20),
                            child: Center(
                              child: Container(
                                height: size.height / 18,
                                decoration: BoxDecoration(
                                    color: buttoncolor == false
                                        ? const Color.fromARGB(255, 39, 39, 39)
                                        : AppColors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: size.width / 1.1,
                                child: Center(
                                  child: loading
                                      ? Center(
                                          child: SizedBox(
                                          height: size.height / 25,
                                          width: size.width / 12,
                                          child: const CircularProgressIndicator(
                                            color: AppColors.white,
                                          ),
                                        ))
                                      : Text('Update Profile',
                                          style: apptextstyle(
                                              color: AppColors.white,
                                              size: 17,
                                              family: 'Kalliyath',
                                              weight: FontWeight.w500)),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                    isemail
                        ? const SizedBox(
                            height: 1,
                          )
                        : GestureDetector(
                            onTap: () {
                              Navigator.of(context).push(MaterialPageRoute(
                                  builder: (ctx) =>
                                      const ChangePasswordPage()));
                            },
                            child: Center(
                              child: Container(
                                height: size.height / 18,
                                decoration: BoxDecoration(
                                    color: AppColors.blue,
                                    borderRadius: BorderRadius.circular(10)),
                                width: size.width / 1.1,
                                child: Center(
                                  child: Text('Change Password',
                                      style: apptextstyle(
                                          color: AppColors.white,
                                          size: 17,
                                          family: 'Kalliyath',
                                          weight: FontWeight.w500)),
                                ),
                              ),
                            ),
                          ),
                  ],
                ),
              );
            },
          ),
        ],
      ),
    ),
  );
}
