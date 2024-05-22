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
  FocusNode focusNodesignup1 = FocusNode();
  FocusNode focusNodesignup2 = FocusNode();
  FocusNode focusNodesignup3 = FocusNode();
  FocusNode focusNodesignup4 = FocusNode();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: signupTile(focusNodesignup1: focusNodesignup1,focusNodesignup2: focusNodesignup2,focusNodesignup3: focusNodesignup3,focusNodesignup4: focusNodesignup4,
            size: size,
            formkey: formkey,
            context: context,
            usernamecontroller: usernamecontroller,
            phoneNumbercontroller: phoneNumbercontroller,
            passwordcontroller: passwordcontroller,
            confirmPasswordcontroller: confirmPasswordcontroller));
  }
}
