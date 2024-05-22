import 'package:flutter/material.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/otp_verification/function.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/otp_verification/otp_tile.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/colors/colors.dart';

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

  dynamic data;
  bool istrue;

  @override
  State<OtpVerificationPage> createState() => _OtpVerificationPageState();
}

class _OtpVerificationPageState extends State<OtpVerificationPage> {
  GlobalKey<FormState> otpkey = GlobalKey<FormState>();
FocusNode focusNodeotp = FocusNode();
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
                    AppColors.black.withOpacity(0.20),
                    BlendMode.saturation,
                  ),
                  image: const AssetImage(
                      'assets/images/Modern House Design.jpeg'))),
          child: otpTile(focusNodeotp: focusNodeotp,
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
