import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';

forgot(context, formkey, phonenumber) async {
  final data = await getAllDocuments();
  if (formkey.currentState!.validate()) {
    bool istrue =
        data.any((element) => element['Phone Number'] == '+91$phonenumber');

    if (istrue) {
      otpSignin(context, data, phonenumber, true);
    } else {
      snackbarAlert(context, 'Please wait');
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}

changePassword(context, formkey, password, repassword, phonenumber) async {
  final val = await getAllDocuments();
  final data = val.firstWhere(
    (element) => element['Phone Number'] == phonenumber,
    orElse: () => {},
  );
  if (formkey.currentState!.validate()) {
    if (password == repassword) {
      final value = {
        'Username': data['Username'],
        'Phone Number': '+91$phonenumber',
        'Password': password,
      };
      signupdata.doc(data['_id']).update(data);
      snackbarSucess(context, 'Success');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => HomeScreen()), (route) => false);
    } else {
      snackbarAlert(context, 'Please Confirm Your Password');
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}
