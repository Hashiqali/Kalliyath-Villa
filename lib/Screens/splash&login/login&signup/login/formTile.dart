import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/ForgotPassword/phoneNumber.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/functions.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/googleLogin.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/otpVerification/otp_verification.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

Widget formTile({context, key, size, phonenumber, password}) {
  return Form(
    key: key,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            ' PhoneNumber',
            style: TextStyle(
                color: Colors.white,
                fontSize: 12,
                fontFamily: 'Kalliyath1',
                fontWeight: FontWeight.w400),
          ),
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
              hintText: 'Phone Number',
              hintStyle: const TextStyle(fontFamily: 'Kalliyath1'),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 30,
          ),
          const Text(
            ' Password',
            style: TextStyle(
                color: Colors.white,
                fontFamily: 'Kalliyath1',
                fontSize: 12,
                fontWeight: FontWeight.w400),
          ),
          BlocBuilder<SplashLoginBloc, SplashLoginState>(
            bloc: bloc1,
            builder: (context, state) {
              bool istrue = true;
              if (state is NotObscureText) {
                istrue = false;
              } else if (state is ObscureText) {
                istrue = true;
              }
              return TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'Enter Password';
                  }
                  return null;
                },
                controller: password,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                obscureText: istrue,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                      onPressed: () {
                        bloc1.add(ObscureEvent(istrue: istrue));
                      },
                      icon: Icon(
                          istrue ? Icons.visibility : Icons.visibility_off)),
                  filled: true,
                  prefixIcon: const Icon(Icons.lock),
                  fillColor: const Color.fromARGB(255, 240, 238, 238),
                  hintText: 'Password',
                  hintStyle: const TextStyle(fontFamily: 'Kalliyath1'),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              );
            },
          ),
          SizedBox(
            height: size.height / 50,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  BlocBuilder<SplashLoginBloc, SplashLoginState>(
                    bloc: bloc1,
                    builder: (context, state) {
                      bool istrue = false;
                      if (state is SwitchON) {
                        istrue = false;
                      } else if (state is SwitchOFF) {
                        istrue = true;
                      }
                      return Switch(
                          inactiveThumbColor: Colors.white,
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.grey,
                          activeColor: Colors.white,
                          trackColor:
                              const MaterialStatePropertyAll(Colors.grey),
                          value: istrue,
                          onChanged: (value) {
                            bloc1.add(SwitchFunction());
                          });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: Color.fromARGB(199, 255, 255, 255),
                      fontFamily: 'Kalliyath1',
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ForgotPhoneNumberPage()));
                },
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                      color: Color.fromARGB(199, 255, 255, 255),
                      fontFamily: 'Kalliyath',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 50,
          ),
          Material(
            clipBehavior: Clip.hardEdge,
            borderRadius: BorderRadius.circular(10),
            color: Colors.transparent,
            child: InkWell(
              splashColor: const Color.fromARGB(121, 129, 128, 128),
              onTap: () {
                login(key, context, '+91${phonenumber.text.trim()}',
                    password.text.trim());
              },
              child: Container(
                height: size.height / 15,
                width: size.width,
                decoration: BoxDecoration(
                  color: const Color.fromARGB(156, 34, 251, 41),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: const Center(
                  child: Text(
                    'Login',
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: 'Kalliyath1',
                      fontSize: 17,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: size.height / 50,
          ),
          googleButton(context: context, size: size, istrue: false),
        ],
      ),
    ),
  );
}
