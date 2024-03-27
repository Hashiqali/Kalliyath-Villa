import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup.dart';
import 'package:kalliyath_villa/Screens/splash&login/splash/splash.dart';

// ignore: must_be_immutable
class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  bool passwordvisible = false;

  final CollectionReference firedata =
      FirebaseFirestore.instance.collection('name');
  GlobalKey<FormState> loginkey = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    Color myColor = const Color.fromARGB(87, 101, 71, 24);
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
              Form(
                key: loginkey,
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Username',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Kalliyath1',
                            fontWeight: FontWeight.w400),
                      ),
                      TextFormField(
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Enter Username';
                          }
                          return null;
                        },
                        controller: usernamecontroller,
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.person),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          hintText: 'Username',
                          hintStyle: const TextStyle(fontFamily: 'Kalliyath1'),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      const Text(
                        ' Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kalliyath1',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      BlocBuilder<SplashLoginBloc, SplashLoginState>(
                        bloc: bloc1,
                        builder: (context, state) {
                          bool istrue = false;
                          if (state is ObscureText) {
                            istrue = true;
                          } else if (state is NotObscureText) {
                            istrue = false;
                          }
                          return TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return 'Enter Password';
                              }
                              return null;
                            },
                            controller: passwordcontroller,
                            autovalidateMode:
                                AutovalidateMode.onUserInteraction,
                            obscureText: istrue,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                  onPressed: () {
                                    bloc1.add(ObscureEvent());
                                  },
                                  icon: Icon(istrue
                                      ? Icons.visibility
                                      : Icons.visibility_off)),
                              filled: true,
                              prefixIcon: Icon(Icons.lock),
                              fillColor:
                                  const Color.fromARGB(255, 240, 238, 238),
                              hintText: 'Password',
                              hintStyle:
                                  const TextStyle(fontFamily: 'Kalliyath1'),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                              ),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              BlocBuilder<SplashLoginBloc, SplashLoginState>(
                                bloc: bloc1,
                                builder: (context, state) {
                                  bool istrue = false;
                                  if (state is SwitchON) {
                                    istrue = false;
                                  } else if (state is SwitchOFF) {
                                    istrue = true;
                                  }
                                  return Switch(
                                      inactiveThumbColor: Colors.white,
                                      inactiveTrackColor: Colors.grey,
                                      activeTrackColor: Colors.grey,
                                      activeColor: Colors.white,
                                      trackColor:
                                          const MaterialStatePropertyAll(
                                              Colors.grey),
                                      value: istrue,
                                      onChanged: (value) {
                                        bloc1.add(SwitchFunction());
                                      });
                                },
                              ),
                              const Text(
                                'Remember me',
                                style: TextStyle(
                                  color: Color.fromARGB(199, 255, 255, 255),
                                  fontFamily: 'Kalliyath1',
                                ),
                              ),
                            ],
                          ),
                          const Text(
                            'Forgot Password ?',
                            style: TextStyle(
                                color: Color.fromARGB(199, 255, 255, 255),
                                fontFamily: 'Kalliyath',
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      Material(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color.fromARGB(121, 129, 128, 128),
                          onTap: () {
                            login(context);
                          },
                          child: Container(
                            height: size.height / 15,
                            width: size.width,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(156, 34, 251, 41),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: const Center(
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontFamily: 'Kalliyath1',
                                  fontSize: 17,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      const Center(
                        child: Text(
                          'Or login with',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kalliyath1',
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 50,
                      ),
                      Center(
                        child: Material(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor:
                                const Color.fromARGB(121, 129, 128, 128),
                            onTap: () {
                              googlelogin(context);
                            },
                            child: Container(
                              height: size.height / 15,
                              width: size.width / 4,
                              decoration: BoxDecoration(
                                color: myColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                  child: Image(
                                      height: 30,
                                      width: 30,
                                      image: AssetImage(
                                          'assets/images/google.png'))),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 50,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    'Don\'t have an account? ',
                    style: TextStyle(
                        color: Colors.white,
                        fontFamily: 'Kalliyath1',
                        fontWeight: FontWeight.w400),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (ctx) => SignupPage()));
                    },
                    child: const Text(
                      'Signup',
                      style: TextStyle(
                          color: Color.fromARGB(255, 50, 217, 55),
                          fontFamily: 'Kalliyath1',
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  login(context) async {
    if (loginkey.currentState!.validate()) {
      final data = await getAllDocuments();
      final istrue = data.any((element) =>
          element['Username'] == usernamecontroller.text &&
          element['Password'] == passwordcontroller.text);
      if (istrue) {
        const messege = 'Success';
        IconSnackBar.show(context,
            duration: const Duration(seconds: 2),
            snackBarType: SnackBarType.success,

            label: messege);
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
      } else {
        const messege = 'Incorrect Username & Password';
        IconSnackBar.show(context,
            duration: const Duration(seconds: 2),
            snackBarType: SnackBarType.alert,
            label: messege);
      }
    } else {
      const messege = 'Enter Username & Password';
      IconSnackBar.show(context,
          duration: const Duration(seconds: 2),
          snackBarType: SnackBarType.alert,
          label: messege);
    }
  }
}
