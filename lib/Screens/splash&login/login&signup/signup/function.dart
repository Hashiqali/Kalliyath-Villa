import 'package:kalliyath_villa/Screens/firebase/functions.dart';
import 'package:kalliyath_villa/Screens/snackbar_widget.dart/widget.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';

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
        'Username': username,
        'Phone Number': '+91$phonenumber',
        'Password': password,
      };
      snackbarAlert(context, 'Please wait');
      otpSignin(context, data, phonenumber, false);
      
    }
  } else {
    snackbarAlert(context, 'Please Fill The Form');
  }
}
