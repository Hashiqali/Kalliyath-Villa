import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/home_screen/homescreen.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/forgot_password/password_page/change_password_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

otpverify(
    {otpkey,
    context,
    verificationId,
    otpController,
    data,
    istrue,
    phoneNumber}) async {
  if (otpkey.currentState!.validate()) {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text.trim());
      await FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (istrue != true) {
          await signupdata.add(data);
          await getsignup();
          final nowsignup = signupDocuments
              .firstWhere((element) => element['Phone Number'] == phoneNumber);


          await adduserdata(nowsignup['Phone Number'], nowsignup['Password'],
              nowsignup['Username'], '', nowsignup['id']);

          return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => const ManiScreen()),
            (route) => false,
          );
        } else {
          return Navigator.of(context).push(
            MaterialPageRoute(
                builder: (ctx) => ChangePasswordTile(
                      phoneNumber: phoneNumber,
                    )),
          );
        }
      }).catchError((e) {
        snackbarAlert(context, 'Incorrect OTP');
      });
    } catch (x) {
      log(x.toString());
    }
  } else {
    snackbarAlert(context, 'Please Enter OTP Number');
  }
}

void resendOTP(String phoneNumber, BuildContext context, otpToken) async {
  FirebaseAuth auth = FirebaseAuth.instance;

  await auth.verifyPhoneNumber(
    forceResendingToken: otpToken,
    phoneNumber: phoneNumber,
    timeout: const Duration(seconds: 30),
    verificationCompleted: (PhoneAuthCredential credential) {
      auth.signInWithCredential(credential).then((value) {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => const HomeScreen()));
      });
    },
    verificationFailed: (FirebaseAuthException e) {},
    codeSent: (String verificationId, int? resendToken) {},
    codeAutoRetrievalTimeout: (String verificationId) {},
  );
}

void startCountdownTimer(Function(int) callback) {
  int secondsRemaining = 30;

  Timer.periodic(const Duration(seconds: 1), (Timer timer) {
    if (secondsRemaining == 0) {
      timer.cancel();
      bloc1.add(OtpTimerDoneEvent());
    } else {
      secondsRemaining--;
      bloc1.add(OtpTimerEvent());
      callback(secondsRemaining);
    }
  });
}
