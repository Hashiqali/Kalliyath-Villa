import 'dart:async';
import 'dart:developer';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/mainscreen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/ForgotPassword/changePassTile.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/functions.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

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
          final id = await signupdata.add(data);
          await getAllDocuments();
          UserprofileUpdate(id.id);
          return Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(builder: (ctx) => ManiScreen()),
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
