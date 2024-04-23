import 'package:flutter/material.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
import 'package:kalliyath_villa/widget/snackbar.dart';

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
      await getsignup();
      snackbarSucess(context, 'Success');
      await adduserdata(phonenumber.substring(3), password, data['Username'],
          data['Image'] ?? '', data['id']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => ManiScreen()), (route) => false);
    } else {
      snackbarAlert(context, 'Please Confirm Your Password');
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}
