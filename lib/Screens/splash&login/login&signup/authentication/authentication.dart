import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/otp_verification.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup.dart';

final CollectionReference firedata =
    FirebaseFirestore.instance.collection('signup');

otpSignin(context, data) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
    verificationCompleted: (PhoneAuthCredential credential) {},
    verificationFailed: (FirebaseAuthException ex) {
      const messege = 'Too many attempts , Please try again later.';
      IconSnackBar.show(context,
          duration: const Duration(seconds: 2),
          snackBarStyle: SnackBarStyle(maxLines: 2),
          snackBarType: SnackBarType.alert,
          label: messege);
    },
    codeSent: (String verificationid, int? resentTocken) {
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(
              builder: (ctx) => OtpVerificationPage(
                    data: data,
                    phoneNumber: '+91${phoneNumberotpcontroller.text.trim()}',
                    otptocken: resentTocken!,
                    verifictionid: verificationid,
                  )),
          (route) => false);
    },
    codeAutoRetrievalTimeout: (String verificationId) {},
    phoneNumber: '+91${phoneNumberotpcontroller.text.trim()}',
    timeout: const Duration(seconds: 30),
  );
}

googleSigning(context) async {
  await GoogleSignIn().signOut();
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? gooogleAuth = await googleUser?.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gooogleAuth?.accessToken, idToken: gooogleAuth?.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  print(userCredential.user?.displayName);
  final val = await getAllDocuments();
  final istrue =
      val.any((element) => element['Email'] == userCredential.user?.email);

  if (!istrue) {
    final data = {
      'Username': userCredential.user?.displayName,
      'Phone Number': userCredential.user?.phoneNumber,
      'Email': userCredential.user?.email,
      'Image': userCredential.user?.photoURL
    };
    await firedata.add(data);
    Navigator.of(context).pop();
    print('success');
  } else {
    const messege = 'Google Account Already Exist';
    IconSnackBar.show(context,
        duration: const Duration(seconds: 2),
        snackBarType: SnackBarType.alert,
        label: messege);
  }
}

googlelogin(context) async {
  await GoogleSignIn().signOut();
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? gooogleAuth = await googleUser?.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gooogleAuth?.accessToken, idToken: gooogleAuth?.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);

  print(userCredential.user?.displayName);

  final val = await getAllDocuments();
  final istrue =
      val.any((element) => element['Email'] == userCredential.user?.email);

  if (istrue) {
    Navigator.of(context)
        .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
  } else {
    const messege = 'Google Account Doesn\'t Exist';
    IconSnackBar.show(context,
        duration: const Duration(seconds: 2),
        snackBarType: SnackBarType.alert,
        label: messege);
  }
}

Future<List<Map<String, dynamic>>> getAllDocuments() async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('signup');

  QuerySnapshot querySnapshot = await firedata.get();

  List<Map<String, dynamic>> dataList = [];

  for (var doc in querySnapshot.docs) {
    if (doc.exists) {
      // Explicitly cast doc.data() to Map<String, dynamic>?
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        dataList.add(data);
      }
    }
  }

  return dataList;
}
