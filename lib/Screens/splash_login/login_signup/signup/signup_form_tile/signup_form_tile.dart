import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/google_Button_widget/google_login_widget.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/signup/function.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

SplashLoginBloc _bloc = SplashLoginBloc();
SplashLoginBloc _bloc1 = SplashLoginBloc();
signupFormTile(
    {context, username, phonenumber, password, cnfmpassword, size, formkey}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(' Username',
            style: apptextstyle(
                color: AppColors.white, size: 12, family: 'Kalliyath1')),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: username,
          validator: (value) {
            if (value!.isEmpty) {
              return 'Please Username';
            }
            return null;
          },
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 238, 238),
            prefixIcon: const Icon(Icons.person),
            hintText: 'Username',
            hintStyle: const TextStyle(
                fontFamily: 'Kalliyath1',
                color: Color.fromARGB(210, 158, 158, 158)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(
          height: size.height / 200,
        ),
        Text(' Phone Number',
            style: apptextstyle(
                color: AppColors.white, size: 12, family: 'Kalliyath1')),
        TextFormField(
          autovalidateMode: AutovalidateMode.onUserInteraction,
          controller: phonenumber,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return 'Please enter phone number';
            }

            final RegExp regex = RegExp(r'^[0-9]+$');
            if (!regex.hasMatch(value)) {
              return 'Please enter valid phone number';
            }
            if (value.length != 10) {
              return 'Phone number must be 10 digits';
            }
            return null;
          },
          inputFormatters: [LengthLimitingTextInputFormatter(10)],
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            filled: true,
            fillColor: const Color.fromARGB(255, 240, 238, 238),
            prefixIcon: const Icon(Icons.phone),
            prefixText: '+91',
            prefixStyle: const TextStyle(color: Colors.black, fontSize: 16.6),
            hintText: 'Phone Number',
            hintStyle: const TextStyle(
                fontFamily: 'Kalliyath1',
                color: Color.fromARGB(210, 158, 158, 158)),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
        SizedBox(
          height: size.height / 200,
        ),
        Text(' Password',
            style: apptextstyle(
                color: AppColors.white, size: 12, family: 'Kalliyath1')),
        BlocBuilder<SplashLoginBloc, SplashLoginState>(
          bloc: _bloc,
          builder: (context, state) {
            bool istrue = true;
            if (state is NotObscureText) {
              istrue = false;
            } else if (state is ObscureText) {
              istrue = true;
            }
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: password,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Password';
                }
                if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }
                return null;
              },
              obscureText: istrue,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  onPressed: () {
                    _bloc.add(ObscureEvent(istrue: istrue));
                  },
                  icon: Icon(istrue ? Icons.visibility : Icons.visibility_off),
                ),
                filled: true,
                fillColor: const Color.fromARGB(255, 240, 238, 238),
                hintText: 'Password',
                hintStyle: const TextStyle(
                  fontFamily: 'Kalliyath1',
                  color: Color.fromARGB(210, 158, 158, 158),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: size.height / 200,
        ),
        Text(
          ' Confirm Password',
          style: apptextstyle(
              color: AppColors.white, size: 12, family: 'Kalliyath1'),
        ),
        BlocBuilder<SplashLoginBloc, SplashLoginState>(
          bloc: _bloc1,
          builder: (context, state) {
            bool istrue = true;
            if (state is NotObscureText) {
              istrue = false;
            } else if (state is ObscureText) {
              istrue = true;
            }
            return TextFormField(
              autovalidateMode: AutovalidateMode.onUserInteraction,
              controller: cnfmpassword,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Please Enter Confirm Password';
                } else if (value.length < 8) {
                  return 'Password must be at least 8 characters long';
                }

                return null;
              },
              obscureText: istrue,
              decoration: InputDecoration(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                    onPressed: () {
                      _bloc1.add(ObscureEvent(istrue: istrue));
                    },
                    icon:
                        Icon(istrue ? Icons.visibility : Icons.visibility_off)),
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
        BlocBuilder<SplashLoginBloc, SplashLoginState>(
          bloc: bloc1,
          builder: (context, state) {
            bool loading = false;

            if (state is LoadingState) {
              loading = true;
            }
            return Material(
              clipBehavior: Clip.hardEdge,
              borderRadius: BorderRadius.circular(10),
              color: Colors.transparent,
              child: InkWell(
                splashColor: const Color.fromARGB(121, 129, 128, 128),
                onTap: () {
                  if (!loading) {
                    signup(
                        context: context,
                        username: username.text.trim(),
                        phonenumber: phonenumber.text.trim(),
                        cnfmpassword: cnfmpassword.text.trim(),
                        formkey: formkey,
                        password: password.text.trim());
                  }
                },
                child: Container(
                  height: size.height / 15,
                  width: size.width,
                  decoration: BoxDecoration(
                    color: AppColors.lightgreen,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: loading
                      ? const Center(
                          child: CircularProgressIndicator(
                          color: AppColors.white,
                        ))
                      : Center(
                          child: Text('Signup',
                              style: apptextstyle(
                                  color: AppColors.white,
                                  size: 17,
                                  family: 'Kalliyath1')),
                        ),
                ),
              ),
            );
          },
        ),
        SizedBox(
          height: size.height / 65,
        ),
        googleButton(context: context, size: size, istrue: true),
        SizedBox(
          height: size.height / 100,
        ),
        GestureDetector(
          onTap: () {
            Navigator.of(context).pop();
          },
          child: const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Already have an account! ',
                    style: TextStyle(
                        color: AppColors.white,
                        fontFamily: 'Kalliyath1',
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: AppColors.lightgreen,
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
  );
}
