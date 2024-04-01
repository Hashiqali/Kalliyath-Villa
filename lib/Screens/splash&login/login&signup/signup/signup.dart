import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/signup/signupTile.dart';

// ignore: must_be_immutable
class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController usernamecontroller = TextEditingController();

  TextEditingController passwordcontroller = TextEditingController();

  TextEditingController confirmPasswordcontroller = TextEditingController();
  TextEditingController phoneNumbercontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: ListView(
      shrinkWrap: true,
      padding: const EdgeInsets.all(0),
      scrollDirection: Axis.vertical,
      children: [
        Container(
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
            child: Form(
              key: formkey,
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 25, top: 5),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          child: IconButton(
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              icon: const Icon(
                                Icons.arrow_back_ios_outlined,
                                color: Color.fromARGB(255, 0, 0, 0),
                              )),
                        )),
                  ),
                  SizedBox(
                    height: size.height / 550,
                  ),
                  const Text(
                    'Signup',
                    style: TextStyle(
                        fontFamily: 'Kalliyath1',
                        color: Colors.white,
                        fontSize: 35),
                  ),
                  signupTile(
                      context: context,
                      username: usernamecontroller,
                      phonenumber: phoneNumbercontroller,
                      password: passwordcontroller,
                      cnfmpassword: confirmPasswordcontroller,
                      formkey: formkey,
                      size: size),
                ],
              ),
            ),
          ),
        ),
      ],
    ));
  }
}
