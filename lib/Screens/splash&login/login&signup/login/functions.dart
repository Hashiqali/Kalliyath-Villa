import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/mainscreen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

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
      userprofileUpdate();
      await Future.delayed(const Duration(seconds: 2));
      await addMultipleData(phoneNumber.substring(3), password,
          values['Username'], values['Image'] ?? '');
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (ctx) => ManiScreen()));
    } else {
      snackbarAlert(context, 'Incorrect Password');
    }
  } else {
    snackbarAlert(context, 'Enter Username & Password');
  }
}

Map<String, dynamic> userData = {};
userprofileUpdate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  final data = {
    'Username': prefs.getString('Username'),
    'Image': prefs.getString('Image')
  };
  userData = data;
  // userData = signupDocuments.firstWhere((element) => element['id'] == id);
  bloc1.add(LoginUpdateEvent());
}

Future<void> addMultipleData(
    phoneNumber, password, username, image) async {
  print('username iss========$username');
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove('Phone Number');
  await prefs.remove('Password');
  await prefs.remove('Username');
  await prefs.remove('Image');
  await prefs.setBool('User', true);
  await prefs.setString('Phone Number', phoneNumber);
  await prefs.setString('Password', password);
  await prefs.setString('Username', username);
  await prefs.setString('Image', image ?? '');
  userprofileUpdate();
}
