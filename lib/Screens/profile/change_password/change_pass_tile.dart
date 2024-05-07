import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/bloc/password_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/change_form_tile.dart/change_form_tile.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

changePassTile(
    {required Size size,
    required PasswordBloc pass,
    required GlobalKey<FormState> key,
    required TextEditingController passcontroller,
    required TextEditingController newpasscontroller,
    required TextEditingController newpasscnfrmcontroller,
    required SplashLoginBloc loadingpassword}) {
  return Container(
    height: size.height,
    width: size.width,
    color: AppColors.black,
    child: SingleChildScrollView(
      child: BlocBuilder<PasswordBloc, PasswordState>(
        bloc: pass,
        builder: (context, state) {
          bool oldpass = true;
          bool newpass = true;
          bool newcnfmpas = true;
          if (state is OldpassEventState) {
            oldpass = state.istrue;
          } else if (state is NewpassEventState) {
            newpass = state.istrue;
          } else if (state is NewConfirmpassEventState) {
            newcnfmpas = state.istrue;
          }
          return Form(
            key: key,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  changePassFormTile(
                      oldpass: oldpass,
                      passcontroller: passcontroller,
                      pass: pass,
                      newpass: newpass,
                      newpasscontroller: newpasscontroller,
                      newpasscnfrmcontroller: newpasscnfrmcontroller,
                      newcnfmpas: newcnfmpas),
                  BlocBuilder<SplashLoginBloc, SplashLoginState>(
                    bloc: loadingpassword,
                    builder: (context, state) {
                      bool loading = false;

                      if (state is LoadingState) {
                        loading = true;
                      } else if (state is SuccessState) {
                        loading = false;
                      }
                      return GestureDetector(
                        onTap: () {
                          if (!loading) {
                            changepasswordbutton(
                                context: context,
                                key: key,
                                loadingpassword: loadingpassword,
                                oldpass: passcontroller.text.trim(),
                                newpass: newpasscontroller.text.trim(),
                                newconfirm: newpasscnfrmcontroller.text.trim());
                          }
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 20, bottom: 20),
                          child: Center(
                            child: Container(
                              height: size.height / 18,
                              decoration: BoxDecoration(
                                  color: AppColors.blue,
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
                                    : Text('Change Password',
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
                ],
              ),
            ),
          );
        },
      ),
    ),
  );
}
