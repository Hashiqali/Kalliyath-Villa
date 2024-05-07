import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/signup/signup_tile.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  final GlobalKey<FormState> formkey = GlobalKey<FormState>();

  final TextEditingController usernamecontroller = TextEditingController();

  final TextEditingController passwordcontroller = TextEditingController();

  final TextEditingController confirmPasswordcontroller =
      TextEditingController();
  final TextEditingController phoneNumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: signupTile(
            size: size,
            formkey: formkey,
            context: context,
            usernamecontroller: usernamecontroller,
            phoneNumbercontroller: phoneNumbercontroller,
            passwordcontroller: passwordcontroller,
            confirmPasswordcontroller: confirmPasswordcontroller));
  }
}
