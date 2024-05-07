import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/bloc/password_bloc.dart';
import 'package:kalliyath_villa/Screens/profile/change_password/change_pass_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

class ChangePasswordPage extends StatefulWidget {
  const ChangePasswordPage({super.key});

  @override
  State<ChangePasswordPage> createState() => _ChangePasswordPage();
}

class _ChangePasswordPage extends State<ChangePasswordPage> {
  TextEditingController passcontroller = TextEditingController();
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController newpasscnfrmcontroller = TextEditingController();
  GlobalKey<FormState> key = GlobalKey<FormState>();

  SplashLoginBloc loadingpassword = SplashLoginBloc();
  PasswordBloc pass = PasswordBloc();
  @override
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: AppColors.black,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: Colors.white),
          backgroundColor: AppColors.black,
          centerTitle: true,
          title: Text('Change Password',
              style: apptextstyle(
                  color: AppColors.white, family: 'Kalliyath', size: 20)),
        ),
        body: changePassTile(
            size: size,
            pass: pass,
            key: key,
            passcontroller: passcontroller,
            newpasscontroller: newpasscontroller,
            newpasscnfrmcontroller: newpasscnfrmcontroller,
            loadingpassword: loadingpassword));
  }
}
