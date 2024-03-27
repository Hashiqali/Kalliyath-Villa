import 'dart:async';
import 'dart:developer';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_icon_snackbar/flutter_icon_snackbar.dart';
import 'package:kalliyath_villa/Screens/Homescreen/homescreen.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';

class OtpVerificationPage extends StatefulWidget {
  OtpVerificationPage(
      {super.key,
      required this.verifictionid,
      required this.otptocken,
      required this.phoneNumber,
      required this.data});
  String verifictionid;
  String phoneNumber;
  int otptocken;
  final data;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  bool passwordvisible = false;

  GlobalKey<FormState> otpkey = GlobalKey<FormState>();

  TextEditingController otp_controller = TextEditingController();
  @override
  void initState() {
    startCountdownTimer((int secondsRemaining) {
      print(
          secondsRemaining); // You can replace this with any action you want to perform on each tick
      seconds = secondsRemaining;
    });
    super.initState();
  }

  int seconds = 30;
  @override
  Widget build(BuildContext context) {
    print('verif=${widget.verifictionid}');
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: size.height,
          width: size.width,
          decoration: BoxDecoration(
              image: DecorationImage(
                  fit: BoxFit.cover,
                  colorFilter: ColorFilter.mode(
                    Colors.black.withOpacity(
                        0.20), // Adjust the opacity for desired contrast
                    BlendMode
                        .saturation, // You can change BlendMode to adjust the effect
                  ),
                  image: const AssetImage(
                      'assets/images/Modern House Design.jpeg'))),
          child: Form(
            key: otpkey,
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
                  height: size.height / 5,
                ),
                const Text(
                  'Otp Verifiction',
                  style: TextStyle(
                      fontFamily: 'Kalliyath1',
                      color: Colors.white,
                      fontSize: 35),
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        ' Enter OTP Number',
                        style: TextStyle(
                            color: Colors.white,
                            fontFamily: 'Kalliyath1',
                            fontSize: 12,
                            fontWeight: FontWeight.w400),
                      ),
                      TextFormField(
                        autovalidateMode: AutovalidateMode.onUserInteraction,
                        controller: otp_controller,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please Enter OTP Number';
                          }
                          return null;
                        },
                        keyboardType: TextInputType.number,
                        decoration: InputDecoration(
                          filled: true,
                          fillColor: const Color.fromARGB(255, 240, 238, 238),
                          hintText: 'Enter OTP Number',
                          prefixIcon: const Icon(Icons.lock_outline_rounded),
                          hintStyle: const TextStyle(
                              fontFamily: 'Kalliyath1',
                              color: Color.fromARGB(210, 158, 158, 158)),
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: size.height / 40,
                      ),
                      Material(
                        clipBehavior: Clip.hardEdge,
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.transparent,
                        child: InkWell(
                          splashColor: const Color.fromARGB(121, 129, 128, 128),
                          onTap: () {
                            verify(otp_controller.text, context);
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
                                'Verify',
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
                      seconds == 0
                          ? GestureDetector(
                              onTap: () {
                                resendOTP(widget.phoneNumber, context);
                              },
                              child: const Center(
                                child: Text(
                                  'Re-send code',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'Kalliyath1',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            )
                          : Center(
                              child: Text(
                                'Re-send code in $seconds',
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontFamily: 'Kalliyath1',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                      SizedBox(
                        height: size.height / 50,
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
  }

  verify(String otp, context) async {
    if (otpkey.currentState!.validate()) {
      try {
        PhoneAuthCredential credential = PhoneAuthProvider.credential(
            verificationId: widget.verifictionid, smsCode: otp_controller.text);
        FirebaseAuth.instance
            .signInWithCredential(credential)
            .then((value) async {
          await firedata.add(widget.data);
          return Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
        });
      } catch (x) {
        log(x.toString());
      }
    } else {
      const messege = 'Please Enter OTP Number';
      IconSnackBar.show(context,
          duration: const Duration(seconds: 2),
          snackBarType: SnackBarType.alert,
          label: messege);
    }
  }

  void resendOTP(String phoneNumber, BuildContext context) async {
    FirebaseAuth auth = FirebaseAuth.instance;

    await auth.verifyPhoneNumber(
      forceResendingToken: widget.otptocken,
      phoneNumber: phoneNumber,
      timeout: const Duration(seconds: 30),
      verificationCompleted: (PhoneAuthCredential credential) {
        auth.signInWithCredential(credential).then((value) {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (ctx) => HomeScreen()));
        });
      },
      verificationFailed: (FirebaseAuthException e) {
        print('Resend failed: ${e.message}');
      },
      codeSent: (String verificationId, int? resendToken) {},
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  void startCountdownTimer(Function(int) callback) {
    int secondsRemaining = 30;

    Timer.periodic(Duration(seconds: 1), (Timer timer) {
      if (secondsRemaining == 0) {
        timer.cancel();
      } else {
        setState(() {
          secondsRemaining--;
          callback(secondsRemaining);
        });
        // Call the callback function with remaining seconds
      }
    });
  }
}
