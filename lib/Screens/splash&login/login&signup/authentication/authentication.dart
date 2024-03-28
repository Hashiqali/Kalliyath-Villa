import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/otpVerification/otp_verification.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup/signup.dart';

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
      await signupdata.add(data);
      Navigator.of(context).pop();
    } else {
      snackbarAlert(context, 'Google Account Already Exist');
    }
  } catch (e) {}
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

    final val = await getAllDocuments();
    final istrue =
        val.any((element) => element['Email'] == userCredential.user?.email);

    if (istrue) {
      Navigator.of(context)
          .pushReplacement(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    } else {
      snackbarAlert(context, 'Google Account Doesn\'t Exist');
    }
  } catch (e) {}
}

Future<List<Map<String, dynamic>>> getAllDocuments() async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('signup');

  QuerySnapshot querySnapshot = await firedata.get();

  List<Map<String, dynamic>> dataList = [];

  for (var doc in querySnapshot.docs) {
    if (doc.exists) {
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        dataList.add(data);
      }
    }
  }

  return dataList;
}
