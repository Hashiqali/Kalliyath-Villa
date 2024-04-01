import 'dart:developer';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/mainscreen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/functions.dart';

import 'package:kalliyath_villa/Screens/splash&login/login&signup/otpVerification/otp_verification.dart';

final CollectionReference signupdata =
    FirebaseFirestore.instance.collection('signup');

otpSignin(context, data, phoneNumber, istrue) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException ex) {
      snackbarAlert(context, 'Too many attempts , Please try again later.');
    },
    codeSent: (String verificationid, int? resentTocken) {
      Navigator.of(context).push(MaterialPageRoute(
          builder: (ctx) => OtpVerificationPage(
                istrue: istrue,
                data: data,
                phoneNumber: '+91$phoneNumber',
                otptocken: resentTocken!,
                verifictionid: verificationid,
              )));
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    phoneNumber: '+91$phoneNumber',
    timeout: const Duration(seconds: 30),
  );
}

googleSigning(context) async {
  try {
    await GoogleSignIn().signOut();
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? gooogleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gooogleAuth?.accessToken, idToken: gooogleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final istrue = signupDocuments
        .any((element) => element['Email'] == userCredential.user?.email);

    if (!istrue) {
      final data = {
        'Username': userCredential.user?.displayName,
        'Phone Number': userCredential.user?.phoneNumber,
        'Email': userCredential.user?.email,
        'Image': userCredential.user?.photoURL
      };
      await signupdata.add(data);
      await getAllDocuments();

      snackbarSucess(context, 'Success');
      Navigator.of(context).pop();
    } else {
      snackbarAlert(context, 'Google Account Already Exist');
    }
  } catch (e) {
    log(e.toString());
  }
}

googlelogin(context) async {
  try {
    await GoogleSignIn().signOut();
    GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
    GoogleSignInAuthentication? gooogleAuth = await googleUser?.authentication;
    AuthCredential credential = GoogleAuthProvider.credential(
        accessToken: gooogleAuth?.accessToken, idToken: gooogleAuth?.idToken);
    UserCredential userCredential =
        await FirebaseAuth.instance.signInWithCredential(credential);

    final istrue = signupDocuments
        .any((element) => element['Email'] == userCredential.user?.email);

    final data = signupDocuments.firstWhere(
        (element) => element['Email'] == userCredential.user?.email);

    if (istrue) {
      snackbarSucess(context, 'Success');
      await Future.delayed(const Duration(seconds: 1));
      await adduserdata(data['Phone Number'] ?? '', data['Passeord'] ?? '',
          data['Username'] ?? '', data['Image'] ?? '');
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => ManiScreen()));
      userprofileUpdate();
    }
  } catch (e) {
    snackbarAlert(context, 'Google Account Doesn\'t Exist');
  }
}
