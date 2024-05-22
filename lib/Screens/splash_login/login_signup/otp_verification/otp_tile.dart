import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/otp_verification/function.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

Widget otpTile(
    {context,
    required FocusNode focusNodeotp,
    otpkey,
    size,
    otpcontroller,
    verifictionid,
    data,
    phonenumber,
    otptoken,
    istrue,
    seconds}) {
  SplashLoginBloc buttonverify = SplashLoginBloc();
  return SafeArea(
    child: Form(
      key: otpkey,
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 40),
            child: Align(
                alignment: Alignment.topLeft,
                child: CircleAvatar(
                  backgroundColor: AppColors.white,
                  child: IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: const Icon(
                        Icons.arrow_back_ios_outlined,
                        color: AppColors.black,
                      )),
                )),
          ),
          SizedBox(
            height: size.height / 5,
          ),
          Text('Otp Verifiction',
              style: apptextstyle(
                  color: AppColors.white, size: 35, family: 'Kalliyath1')),
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
                      color: AppColors.white,
                      fontFamily: 'Kalliyath1',
                      fontSize: 12,
                      fontWeight: FontWeight.w400),
                ),
                TextFormField(
                  focusNode: focusNodeotp,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: otpcontroller,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return 'Please Enter OTP Number';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.white,
                    hintText: 'Enter OTP Number',
                    prefixIcon: const Icon(Icons.lock_outline_rounded),
                    hintStyle: const TextStyle(
                        fontSize: 13,
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
                BlocBuilder<SplashLoginBloc, SplashLoginState>(
                  bloc: buttonverify,
                  builder: (context, state) {
                    bool loading = false;

                    if (state is LoadingState) {
                      loading = true;
                    }
                    return Material(
                      clipBehavior: Clip.hardEdge,
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.transparent,
                      child: InkWell(
                        splashColor: const Color.fromARGB(121, 129, 128, 128),
                        onTap: () {
                          if (!loading) {
                            focusNodeotp.unfocus();
                            buttonverify.add(LodingEvent(istrue: true));
                            otpverify(
                                istrue: istrue,
                                phoneNumber: phonenumber,
                                verificationId: verifictionid,
                                context: context,
                                data: data,
                                otpController: otpcontroller,
                                otpkey: otpkey);
                          }
                        },
                        child: Container(
                          height: size.height / 15,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: AppColors.lightgreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: loading
                              ? const Center(
                                  child: CircularProgressIndicator(
                                  color: Colors.white,
                                ))
                              : Center(
                                  child: Text(
                                    'Verify',
                                    style: apptextstyle(
                                        color: AppColors.white,
                                        size: 17,
                                        family: 'Kalliyath1'),
                                  ),
                                ),
                        ),
                      ),
                    );
                  },
                ),
                SizedBox(
                  height: size.height / 50,
                ),
                BlocBuilder<SplashLoginBloc, SplashLoginState>(
                  bloc: bloc1,
                  builder: (context, state) {
                    if (state is OtpTimerState) {
                      print('builded== $seconds');
                      return Center(
                        child: Text(
                          'Re-send code in $secondss',
                          style: const TextStyle(
                              color: AppColors.white,
                              fontFamily: 'Kalliyath1',
                              fontWeight: FontWeight.w400),
                        ),
                      );
                    } else if (state is OtpTimerDoneState) {
                      return GestureDetector(
                        onTap: () {
                          resendOTP(phonenumber, context, otptoken);
                        },
                        child: const Center(
                          child: Text(
                            'Re-send code',
                            style: TextStyle(
                                color: AppColors.white,
                                fontFamily: 'Kalliyath1',
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      );
                    }
                    return const SizedBox();
                  },
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
  );
}
