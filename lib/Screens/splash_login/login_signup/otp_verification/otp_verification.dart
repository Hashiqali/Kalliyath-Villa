import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/otp_verification/function.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/otp_verification/otpTile.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

// ignore: must_be_immutable
class OtpVerificationPage extends StatefulWidget {
  OtpVerificationPage(
      {super.key,
      required this.istrue,
      required this.verifictionid,
      required this.otptocken,
      required this.phoneNumber,
      required this.data});
  String verifictionid;
  String phoneNumber;
  int otptocken;
  // ignore: prefer_typing_uninitialized_variables
  final data;
  bool istrue;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  GlobalKey<FormState> otpkey = GlobalKey<FormState>();

  TextEditingController otpcontroller = TextEditingController();

  @override
  void initState() {
    bloc1.add(OtpTimerEvent());
    startCountdownTimer((int secondsRemaining) {
      seconds = secondsRemaining;
    });
    super.initState();
  }

  int seconds = 30;

  @override
  Widget build(BuildContext context) {
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
                    Colors.black.withOpacity(0.20),
                    BlendMode.saturation,
                  ),
                  image: const AssetImage(
                      'assets/images/Modern House Design.jpeg'))),
          child: otpTile(
              istrue: widget.istrue,
              context: context,
              data: widget.data,
              otpcontroller: otpcontroller,
              otpkey: otpkey,
              otptoken: widget.otptocken,
              phonenumber: widget.phoneNumber,
              seconds: seconds,
              verifictionid: widget.verifictionid,
              size: size),
        ),
      ),
    );
  }
}
