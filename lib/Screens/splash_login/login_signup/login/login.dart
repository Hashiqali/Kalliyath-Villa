import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/form_tile/form_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/login_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool passwordvisible = false;

  GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  TextEditingController phonenumbercontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();
  @override
  void initState() {
    if (switchON) {
      init();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return loginTile(
        size: size,
        bloc1: bloc1,
        loginkey: loginkey,
        passwordcontroller: passwordcontroller,
        phonenumbercontroller: phonenumbercontroller);
  }

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phonenumbercontroller.text = prefs.getString('Phone Number')!;
    passwordcontroller.text = prefs.getString('Password')!;
  }
}
