import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/login.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/otp_verification.dart';

class SignupPage extends StatelessWidget {
  SignupPage({super.key});

  bool passwordvisible = false;

  bool passwordvisible1 = false;

  GlobalKey<FormState> formkey = GlobalKey<FormState>();

  TextEditingController Usernamecontroller = TextEditingController();

  TextEditingController PhoneNumbercontroller = TextEditingController();

  TextEditingController Passwordcontroller = TextEditingController();

  TextEditingController ConfirmPasswordcontroller = TextEditingController();

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
          child: Form(
            key: formkey,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, top: 40),
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
                  height: size.height / 500,
                ),
                const Text(
                  'Signup',
                  style: TextStyle(
                      fontFamily: 'Kalliyath1',
                      color: Colors.white,
                      fontSize: 35),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Username',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kalliyath1',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: Usernamecontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Username';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          prefixIcon: const Icon(Icons.person),
                          hintText: 'Username',
                          hintStyle: const TextStyle(
                              fontFamily: 'Kalliyath1',
                              color: Color.fromARGB(210, 158, 158, 158)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 200,
                      ),
                      const Text(
                        ' Phone Number',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kalliyath1',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: PhoneNumbercontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Phone Number';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          prefixIcon: const Icon(Icons.phone),
                          hintText: 'Phone Number',
                          hintStyle: const TextStyle(
                              fontFamily: 'Kalliyath1',
                              color: Color.fromARGB(210, 158, 158, 158)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 200,
                      ),
                      const Text(
                        ' Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Kalliyath1',
                            fontWeight: FontWeight.w400),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: Passwordcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Password';
                          }
                          return null;
                        },
                        obscureText: passwordvisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          hintText: 'Password',
                          hintStyle: const TextStyle(
                              fontFamily: 'Kalliyath1',
                              color: Color.fromARGB(210, 158, 158, 158)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 200,
                      ),
                      const Text(
                        ' Confirm Password',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontFamily: 'Kalliyath1',
                            fontWeight: FontWeight.w400),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: ConfirmPasswordcontroller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter Confirm Password';
                          }
                          return null;
                        },
                        obscureText: passwordvisible,
                        decoration: InputDecoration(
                          prefixIcon: const Icon(Icons.lock),
                          suffixIcon: IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.remove_red_eye)),
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          hintText: 'Confirm Password',
                          hintStyle: const TextStyle(
                              fontFamily: 'Kalliyath1',
                              color: Color.fromARGB(210, 158, 158, 158)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 30,
                      ),
                      Material(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color.fromARGB(121, 129, 128, 128),
                          onTap: () {
                            signup(context);
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
                                'Signup',
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
                          'Or Signup with',
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
                              print('hello');
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
                SizedBox(
                  height: size.height / 900,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account! ',
                      style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Kalliyath1',
                          fontWeight: FontWeight.w400),
                    ),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).pop();
                      },
                      child: const Text(
                        'Login',
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
      ),
    );
  }

  signup(context) {
    if (formkey.currentState!.validate()) {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (ctx) => OtpVerificationPage()));
    } else {
      const messege = 'Please Fill The Form';
      IconSnackBar.show(context,
          duration: const Duration(seconds: 2),
          snackBarType: SnackBarType.alert,
          label: messege);
    }
  }
}
