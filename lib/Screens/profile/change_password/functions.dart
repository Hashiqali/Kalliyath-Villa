import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:kalliyath_villa/Screens/profile/functions.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/functions.dart';
import 'package:kalliyath_villa/firebase/user.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';

changepasswordbutton(
    {required String oldpass,
    required String newpass,
    required String newconfirm,
    required BuildContext context,
    required GlobalKey<FormState> key,
    required loadingpassword}) async {
  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('signup');
  if (key.currentState!.validate()) {
    if (oldpass != personalinfromation['Password']) {
      snackbarFail(context, 'Old Password Is Incorrect');
    } else if (newconfirm != newpass) {
      snackbarFail(context, 'Please Confirm Your Password');
    } else {
      loadingpassword.add(LodingEvent(istrue: true));
      await firedata.doc(appuserid).update({'Password': newpass});
      await getprofiles(userData['Userid']);
      snackbarSucess(context, 'Success');
      Navigator.pop(context);
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}
