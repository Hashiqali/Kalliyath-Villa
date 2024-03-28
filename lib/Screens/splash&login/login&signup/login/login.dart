import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login/formTile.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup/signup.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

List signupList = [];

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  bool passwordvisible = false;

  GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  TextEditingController phonenumbercontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

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
}
