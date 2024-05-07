import 'package:kalliyath_villa/firebase/get_functions.dart';
import 'package:kalliyath_villa/widget/snackbar_widget/snackbar.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

signup(
    {context, formkey, username, phonenumber, password, cnfmpassword}) async {
  if (formkey.currentState!.validate()) {
    bool istrue = signupDocuments
        .any((element) => element['Phone Number'] == '+91$phonenumber');

    if (password != cnfmpassword) {
      snackbarAlert(context, 'Please Confirm Your Password');
    } else if (istrue) {
      snackbarAlert(context, 'Phone Number Already Exist');
    } else {
      final data = {
        'Email': "",
        'Username': username,
        'Phone Number': '+91$phonenumber',
        'Password': password,
        'status':false,
      };
      snackbarAlert(context, 'Please wait');
      bloc1.add(LodingEvent(istrue: true));
      otpSignin(context, data, phonenumber, false);
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}
