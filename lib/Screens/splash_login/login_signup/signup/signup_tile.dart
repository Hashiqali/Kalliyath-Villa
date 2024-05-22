import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/signup/signup_form_tile/signup_form_tile.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

signupTile(
    {required Size size,
    required formkey,
    required FocusNode focusNodesignup1,
    required FocusNode focusNodesignup2,
    required FocusNode focusNodesignup3,
    required FocusNode focusNodesignup4,
    required BuildContext context,
    required TextEditingController usernamecontroller,
    required TextEditingController phoneNumbercontroller,
    required TextEditingController passwordcontroller,
    required TextEditingController confirmPasswordcontroller}) {
  return ListView(
    shrinkWrap: true,
    padding: const EdgeInsets.all(0),
    scrollDirection: Axis.vertical,
    children: [
      Container(
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
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 5),
                  child: Align(
                      alignment: Alignment.topLeft,
                      child: CircleAvatar(
                        backgroundColor: AppColors.white,
                        child: IconButton(
                            onPressed: () {
                              focusNodesignup1.unfocus();
                              focusNodesignup2.unfocus();
                              focusNodesignup3.unfocus();
                              focusNodesignup4.unfocus();
                              Navigator.of(context).pop();
                            },
                            icon: const Icon(Icons.arrow_back_ios_outlined,
                                color: AppColors.black)),
                      )),
                ),
                SizedBox(
                  height: size.height / 550,
                ),
                Text('Signup',
                    style: apptextstyle(
                        color: AppColors.white,
                        size: 35,
                        family: 'Kalliyath1')),
                signupFormTile(
                    focusNodesignup1: focusNodesignup1,
                    focusNodesignup2: focusNodesignup2,
                    focusNodesignup3: focusNodesignup3,
                    focusNodesignup4: focusNodesignup4,
                    context: context,
                    username: usernamecontroller,
                    phonenumber: phoneNumbercontroller,
                    password: passwordcontroller,
                    cnfmpassword: confirmPasswordcontroller,
                    formkey: formkey,
                    size: size),
              ],
            ),
          ),
        ),
      ),
    ],
  );
}
