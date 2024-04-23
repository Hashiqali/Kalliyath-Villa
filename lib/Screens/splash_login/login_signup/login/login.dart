import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/login/formTile.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/signup/signup.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
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

    return BlocConsumer<SplashLoginBloc, SplashLoginState>(
      bloc: bloc1,
      listener: (context, state) {
        if (state is NavigateTosignup) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => SignupPage()));
        }
      },
      builder: (context, state) {
        return Scaffold(
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      colorFilter: ColorFilter.mode(
                        Colors.black.withOpacity(0.20),
                        BlendMode.saturation,
                      ),
                      image: const AssetImage(
                          'assets/images/Modern House Design.jpeg'))),
              child: SafeArea(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Login',
                      style: TextStyle(
                          fontFamily: 'Kalliyath1',
                          color: Colors.white,
                          fontSize: 35),
                    ),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    formTile(
                        context: context,
                        key: loginkey,
                        password: passwordcontroller,
                        size: size,
                        phonenumber: phonenumbercontroller),
                    SizedBox(
                      height: size.height / 50,
                    ),
                    GestureDetector(
                      onTap: () {
                        bloc1.add(LoginToSignupEvent());
                      },
                      child: const Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Don\'t have an account? ',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Kalliyath1',
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Signup',
                                style: TextStyle(
                                    color: Color.fromARGB(255, 50, 217, 55),
                                    fontFamily: 'Kalliyath1',
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  init() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    phonenumbercontroller.text = prefs.getString('Phone Number')!;
    passwordcontroller.text = prefs.getString('Password')!;
  }
}
