import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/forgot_password/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

passwordTile(
    {required Size size,
    required changePasskey,
    required BuildContext context,
    required blocp1,
    required blocp,
    required TextEditingController newpasscontroller,
    required TextEditingController newRepasscontroller,
    required String phoneNumber}) {
  return SingleChildScrollView(
    child: Container(
      height: size.height,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.black.withOpacity(0.20),
                BlendMode.saturation,
              ),
              image:
                  const AssetImage('assets/images/Modern House Design.jpeg'))),
      child: SafeArea(
        child: Form(
          key: changePasskey,
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 25, top: 40),
                child: Align(
                    alignment: Alignment.topLeft,
                    child: CircleAvatar(
                      backgroundColor: AppColors.white,
                      child: IconButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: const Icon(
                            Icons.arrow_back_ios_outlined,
                            color: AppColors.black,
                          )),
                    )),
              ),
              SizedBox(
                height: size.height / 500,
              ),
              SizedBox(
                height: size.height / 8,
              ),
              Text('New Password',
                  style: apptextstyle(
                      color: AppColors.white,
                      size: 35,
                      family: 'Kalliyath1',
                      weight: FontWeight.w100)),
              SizedBox(
                height: size.height / 900,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Password',
                        style: apptextstyle(
                          color: AppColors.white,
                          size: 12,
                          family: 'kalliyath1',
                        )),
                    BlocBuilder<SplashLoginBloc, SplashLoginState>(
                      bloc: blocp,
                      builder: (context, state) {
                        bool istrue = true;
                        if (state is NotObscureText) {
                          istrue = false;
                        } else if (state is ObscureText) {
                          istrue = true;
                        }
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: newpasscontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          obscureText: istrue,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  blocp.add(ObscureEvent(istrue: istrue));
                                },
                                icon: Icon(istrue
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 238, 238),
                            hintText: 'Password',
                            hintStyle: const TextStyle(
                                fontFamily: 'Kalliyath1',
                                color: Color.fromARGB(210, 158, 158, 158)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      },
                    ),
                    Text(' Confirm Password',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 12,
                            family: 'Kalliyath1')),
                    BlocBuilder<SplashLoginBloc, SplashLoginState>(
                      bloc: blocp1,
                      builder: (context, state) {
                        bool istrue = true;
                        if (state is NotObscureText) {
                          istrue = false;
                        } else if (state is ObscureText) {
                          istrue = true;
                        }
                        return TextFormField(
                          autovalidateMode: AutovalidateMode.onUserInteraction,
                          controller: newRepasscontroller,
                          validator: (value) {
                            if (value!.isEmpty) {
                              return 'Please Enter Password';
                            }
                            return null;
                          },
                          obscureText: istrue,
                          decoration: InputDecoration(
                            prefixIcon: const Icon(Icons.lock),
                            suffixIcon: IconButton(
                                onPressed: () {
                                  blocp1.add(ObscureEvent(istrue: istrue));
                                },
                                icon: Icon(istrue
                                    ? Icons.visibility
                                    : Icons.visibility_off)),
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 238, 238),
                            hintText: 'Confirm Password',
                            hintStyle: const TextStyle(
                                fontFamily: 'Kalliyath1',
                                color: Color.fromARGB(210, 158, 158, 158)),
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                        );
                      },
                    ),
                    SizedBox(
                      height: size.height / 30,
                    ),
                    Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: const Color.fromARGB(121, 129, 128, 128),
                        onTap: () {
                          changePassword(
                              context,
                              changePasskey,
                              newpasscontroller.text.trim(),
                              newRepasscontroller.text.trim(),
                              phoneNumber);
                        },
                        child: Container(
                          height: size.height / 15,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: AppColors.lightgreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Signup',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 17,
                                    family: 'Kalliyath1')),
                          ),
                        ),
                      ),
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
}
