import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/googleLogin.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup/function.dart';

SplashLoginBloc _bloc = SplashLoginBloc();
SplashLoginBloc _bloc1 = SplashLoginBloc();
signupTile(
    {context, username, phonenumber, password, cnfmpassword, size, formkey}) {
  return Padding(
    padding: const EdgeInsets.only(left: 15, right: 15),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          ' Username',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kalliyath1',
              fontSize: 12,
              fontWeight: FontWeight.w400),
        ),
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
        const Text(
          ' Phone Number',
          style: TextStyle(
              color: Colors.white,
              fontFamily: 'Kalliyath1',
              fontSize: 12,
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
        const Text(
          ' Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Kalliyath1',
              fontWeight: FontWeight.w400),
        ),
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
        const Text(
          ' Confirm Password',
          style: TextStyle(
              color: Colors.white,
              fontSize: 12,
              fontFamily: 'Kalliyath1',
              fontWeight: FontWeight.w400),
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
        Material(
          clipBehavior: Clip.hardEdge,
          borderRadius: BorderRadius.circular(10),
          color: Colors.transparent,
          child: InkWell(
            splashColor: const Color.fromARGB(121, 129, 128, 128),
            onTap: () {
              signup(
                  context: context,
                  username: username.text.trim(),
                  phonenumber: phonenumber.text.trim(),
                  cnfmpassword: cnfmpassword.text.trim(),
                  formkey: formkey,
                  password: password.text.trim());
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
                  'Signup',
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
                        color: Colors.white,
                        fontFamily: 'Kalliyath1',
                        fontWeight: FontWeight.w400),
                  ),
                  Text(
                    'Login',
                    style: TextStyle(
                        color: Color.fromARGB(255, 50, 217, 55),
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
