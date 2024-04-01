import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/mainscreen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(key, context, phoneNumber, password) async {
  if (key.currentState!.validate()) {
    final userExists = signupDocuments
        .any((element) => element['Phone Number'] == phoneNumber);
    final passwordCorrect = signupDocuments.any((element) =>
        element['Phone Number'] == phoneNumber &&
        element['Password'] == password);

    if (!userExists) {
      snackbarAlert(context, 'Incorrect Phone Number');
    } else if (!passwordCorrect) {
      snackbarAlert(context, 'Incorrect Password');
    } else {
      snackbarSucess(context, 'Success');

      final userData = signupDocuments.firstWhere((element) =>
          element['Phone Number'] == phoneNumber &&
          element['Password'] == password);

      await Future.delayed(const Duration(seconds: 2));
      await adduserdata(phoneNumber.substring(3), password,
          userData['Username'], userData['Image'] ?? '');
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => ManiScreen()), (route) => false);
    }
  } else {
    snackbarAlert(context, 'Enter Username & Password');
  }
}

Map<String, dynamic> userData = {};
userprofileUpdate() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  final data = await {
    'Username': prefs.getString('Username'),
    'Image': prefs.getString('Image')
  };
  userData = data;

  bloc1.add(LoginUpdateEvent());
}

Future<void> adduserdata(phoneNumber, password, username, image) async {
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
  await userprofileUpdate();
}
