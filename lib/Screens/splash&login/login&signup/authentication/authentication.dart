import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/otp_verification.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup.dart';

final CollectionReference firedata =
    FirebaseFirestore.instance.collection('signup');

auth(context) async {
  await FirebaseAuth.instance.verifyPhoneNumber(
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException ex) {
        print('failed=====$ex');
      },
      codeSent: (String verificationid, int? resentTocken) {
        Navigator.of(context).pushReplacement(MaterialPageRoute(
            builder: (ctx) => OtpVerificationPage(
                  verifictionid: verificationid,
                )));
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
      phoneNumber: '+91${phoneNumberotpcontroller.text.trim()}');
}

googleSigning(context) async {
  GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
  GoogleSignInAuthentication? gooogleAuth = await googleUser?.authentication;
  AuthCredential credential = GoogleAuthProvider.credential(
      accessToken: gooogleAuth?.accessToken, idToken: gooogleAuth?.idToken);
  UserCredential userCredential =
      await FirebaseAuth.instance.signInWithCredential(credential);
  print(userCredential.user?.displayName);

  final data = {
    'Username': userCredential.user?.displayName,
    'Phone Number': userCredential.user?.phoneNumber,
    'Email': userCredential.user?.email,
    'Image': userCredential.user?.photoURL
  };
  await firedata.add(data);
  print('success');
  Navigator.of(context).pop();
}

 getAllDocuments() async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('signup');

  QuerySnapshot querySnapshot = await firedata.get();

  List<Map<String, dynamic>> dataList = [];

  querySnapshot.docs.forEach((doc) {
    if (doc.exists) {
      // Explicitly cast doc.data() to Map<String, dynamic>?
      Map<String, dynamic>? data = doc.data() as Map<String, dynamic>?;
      if (data != null) {
        dataList.add(data);
      }
    }
  });

  print(dataList);
}
