import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/mainscreen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

login(key, context, phoneNumber, password) async {
  if (key.currentState!.validate()) {
    final istrue1 = signupDocuments
        .any((element) => element['Phone Number'] == phoneNumber);

    final istrue2 = signupDocuments.any((element) =>
        element['Phone Number'] == phoneNumber &&
        element['Password'] == password);
    final values = signupDocuments.firstWhere((element) =>
        element['Phone Number'] == phoneNumber &&
        element['Password'] == password);
    if (!istrue1) {
      snackbarAlert(context, 'Incorrect Phone Number & Password');
    } else if (!istrue1) {
      snackbarAlert(context, 'Incorrect Phone Number');
    } else if (istrue2) {
      snackbarSucess(context, 'Success');
      await Future.delayed(const Duration(seconds: 2));
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ManiScreen()));
      UserprofileUpdate(values['id']);
    } else {
      snackbarAlert(context, 'Incorrect Password');
    }
  } else {
    snackbarAlert(context, 'Enter Username & Password');
  }
}

Map<String, dynamic> userData = {};
UserprofileUpdate(String id) {
  userData = signupDocuments.firstWhere((element) => element['id'] == id);
  bloc1.add(LoginUpdateEvent());
}
