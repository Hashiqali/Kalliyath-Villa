import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/forgot_password/number_page/forgot_number_page.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';
import 'package:kalliyath_villa/widget/google_Button_widget/google_login_widget.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

bool switchON = false;
Widget formTile({
  context,
  key,
  size,
  phonenumber,
  password,
  required FocusNode focusNodelogin1,
  required FocusNode focusNodelogin2,
}) {
  return Form(
    key: key,
    child: Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(' PhoneNumber',
              style: apptextstyle(
                  color: AppColors.white, size: 12, family: 'Kalliyath1')),
          TextFormField(
            focusNode: focusNodelogin1,
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
          Text(' Password',
              style: apptextstyle(
                  color: AppColors.white, size: 12, family: 'Kalliyath1')),
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
                focusNode: focusNodelogin2,
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
                      bool istrue = switchON;
                      if (state is SwitchON) {
                        istrue = false;
                      } else if (state is SwitchOFF) {
                        istrue = true;
                      }
                      return Switch(
                          inactiveThumbColor: AppColors.white,
                          inactiveTrackColor: Colors.grey,
                          activeTrackColor: Colors.grey,
                          activeColor: AppColors.white,
                          trackColor:
                              const MaterialStatePropertyAll(Colors.grey),
                          value: istrue,
                          onChanged: (value) {
                            bloc1.add(SwitchFunction());
                            switchON = value;
                          });
                    },
                  ),
                  const Text(
                    'Remember me',
                    style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Kalliyath1',
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  focusNodelogin1.unfocus();
                  focusNodelogin2.unfocus();
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (ctx) => ForgotPhoneNumberPage()));
                },
                child: const Text(
                  'Forgot Password ?',
                  style: TextStyle(
                      color: AppColors.white,
                      fontFamily: 'Kalliyath',
                      fontWeight: FontWeight.w500),
                ),
              ),
            ],
          ),
          SizedBox(
            height: size.height / 50,
          ),
          BlocBuilder<SplashLoginBloc, SplashLoginState>(
            bloc: bloc1,
            builder: (context, state) {
              bool loading = false;

              if (state is LoadingState) {
                loading = true;
              } else if (state is SuccessState) {
                loading = false;
              }
              return Material(
                clipBehavior: Clip.hardEdge,
                borderRadius: BorderRadius.circular(10),
                color: Colors.transparent,
                child: InkWell(
                  splashColor: const Color.fromARGB(121, 129, 128, 128),
                  onTap: () {
                    if (!loading) {
                      login(
                          key,
                          context,
                          '+91${phonenumber.text.trim()}',
                          password.text.trim(),
                          focusNodelogin1,
                          focusNodelogin2);
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
                            color: Colors.white,
                          ))
                        : Center(
                            child: Text('Login',
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
            height: size.height / 50,
          ),
          googleButton(
            context: context,
            size: size,
            istrue: false,
          ),
        ],
      ),
    ),
  );
}
