import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/Screens/main_screen/mainscreen.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';
import 'package:shared_preferences/shared_preferences.dart';

login(key, context, phoneNumber, password) async {
  if (key.currentState!.validate()) {
    bloc1.add(LodingEvent(istrue: false));
    await getsignup();
    final userExists = signupDocuments
        .any((element) => element['Phone Number'] == phoneNumber);
    final passwordCorrect = signupDocuments.any((element) =>
        element['Phone Number'] == phoneNumber &&
        element['Password'] == password);
    final status = signupDocuments.any((element) => element['status'] == true);

    if (!userExists) {
      snackbarAlert(context, 'Incorrect Phone Number');
    } else if (!passwordCorrect) {
      snackbarAlert(context, 'Incorrect Password');
    } else if (status == true) {
      snackbarAlert(context, 'Your account has been blocked');
    } else {
      bloc1.add(LodingEvent(istrue: true));
      await Future.delayed(const Duration(seconds: 3));
      snackbarSucess(context, 'Success');
      final userData = signupDocuments.firstWhere((element) =>
          element['Phone Number'] == phoneNumber &&
          element['Password'] == password);

      await Future.delayed(const Duration(seconds: 2));
      await adduserdata(phoneNumber.substring(3), password,
          userData['Username'], userData['Image'] ?? '', userData['id']);
      Navigator.of(context).pushAndRemoveUntil(
          MaterialPageRoute(builder: (ctx) => const ManiScreen()),
          (route) => false);
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
    'Image': prefs.getString('Image'),
    'Userid': prefs.getString('Userid')
  };

  userData = data;

  appuserid = data['Userid']!;
  appusername = data['Username']!;
  appuserphoto = data['Image']!;

  await getprofiles(userData['Userid']);

  bloc1.add(LoginUpdateEvent());
}

Future<void> adduserdata(phoneNumber, password, username, image, id) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();

  await prefs.remove('Phone Number');
  await prefs.remove('Password');
  await prefs.remove('Username');
  await prefs.remove('Userid');
  await prefs.remove('Image');
  await prefs.setBool('User', true);
  await prefs.setString('Phone Number', phoneNumber);
  await prefs.setString('Password', password);
  await prefs.setString('Username', username);
  await prefs.setString('Userid', id);
  await prefs.setString('Image', image ?? '');

  await userprofileUpdate();
}
