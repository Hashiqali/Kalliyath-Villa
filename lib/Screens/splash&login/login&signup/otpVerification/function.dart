import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/ForgotPassword/changePassTile.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

otpverify(
    {otpkey,
    context,
    verificationId,
    otpController,
    data,
    istrue,
    phoneNumber}) async {
  final data = await getAllDocuments();
  if (otpkey.currentState!.validate()) {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otpController.text.trim());
      FirebaseAuth.instance
          .signInWithCredential(credential)
          .then((value) async {
        if (istrue != true) {
          await signupdata.add(data);
          return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => HomeScreen()),
            (route) => false,
          );
        } else {
          if (data.any((element) => element['Phone Number'] == phoneNumber)) {
            return Navigator.of(context).push(
              MaterialPageRoute(
                  builder: (ctx) => ChangePasswordTile(
                        phoneNumber: phoneNumber,
                      )),
            );
          } else {
            snackbarAlert(context, '');
          }
        }
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
            .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
      });
    },
    verificationFailed: (FirebaseAuthException e) {
      print('Resend failed: ${e.message}');
    },
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
