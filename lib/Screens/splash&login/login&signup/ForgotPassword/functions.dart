import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/mainscreen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/functions.dart';

forgot(context, formkey, phonenumber) async {
  if (formkey.currentState!.validate()) {
    bool istrue = signupDocuments
        .any((element) => element['Phone Number'] == '+91$phonenumber');

    if (istrue) {
      snackbarAlert(context, 'Please wait');
      otpSignin(context, {}, phonenumber, true);
    } else {
      snackbarAlert(context, 'Incorrect Phone Number');
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}

changePassword(context, formkey, password, repassword, phonenumber) async {
  final data = signupDocuments.firstWhere(
    (element) => element['Phone Number'] == phonenumber,
    orElse: () => {},
  );
  if (formkey.currentState!.validate()) {
    if (password == repassword) {
      final value = {
        'Username': data['Username'],
        'Phone Number': phonenumber,
        'Password': password,
      };
      signupdata.doc(data['id']).update(value);
      await getAllDocuments();
      snackbarSucess(context, 'Success');
      await addMultipleData(phonenumber.substring(3), password, 
          data['Username'], data['Image'] ?? '');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => ManiScreen()), (route) => false);
    } else {
      snackbarAlert(context, 'Please Confirm Your Password');
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}
