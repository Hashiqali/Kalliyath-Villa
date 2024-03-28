import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';

login(key, context, phoneNumber, password) async {
  if (key.currentState!.validate()) {
    final data = await getAllDocuments();
    final istrue = data.any((element) => element['Password'] == password);
    final istrue1 =
        data.any((element) => element['Phone Number'] == phoneNumber);
    if (!istrue1 && !istrue) {
      snackbarAlert(context, 'Incorrect Phone Number & Password');
    } else if (!istrue1) {
      snackbarAlert(context, 'Incorrect Phone Number');
    } else if (!istrue && istrue1) {
      snackbarAlert(context, 'Incorrect Password');
    } else {
      snackbarSucess(context, 'Success');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
    }
  } else {
    snackbarAlert(context, 'Enter Username & Password');
  }
}
