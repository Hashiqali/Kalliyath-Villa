import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/otp_verification/function.dart';
import 'package:kalliyath_villa/Screens/splash_login/splash/splash.dart';

Widget otpTile(
    {context,
    otpkey,
    size,
    otpcontroller,
    verifictionid,
    data,
    phonenumber,
    otptoken,
    istrue,
    seconds}) {
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
                fontFamily: 'Kalliyath1', color: Colors.white, fontSize: 35),
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
                    fillColor: const Color.fromARGB(255, 240, 238, 238),
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
                Material(
                  clipBehavior: Clip.hardEdge,
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.transparent,
                  child: InkWell(
                    splashColor: const Color.fromARGB(121, 129, 128, 128),
                    onTap: () {
                      otpverify(
                          istrue: istrue,
                          phoneNumber: phonenumber,
                          verificationId: verifictionid,
                          context: context,
                          data: data,
                          otpController: otpcontroller,
                          otpkey: otpkey);
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
                BlocBuilder<SplashLoginBloc, SplashLoginState>(
                  bloc: bloc1,
                  builder: (context, state) {
                    if (state is OtpTimerState) {
                      return Center(
                        child: Text(
                          'Re-send code in $seconds',
                          style: const TextStyle(
                              color: Colors.white,
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
                                color: Colors.white,
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
