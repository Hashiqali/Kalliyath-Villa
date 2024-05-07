import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalliyath_villa/Screens/splash_login/login_signup/forgot_password/functions.dart';
import 'package:kalliyath_villa/colors/colors.dart';
import 'package:kalliyath_villa/style/textstyle.dart';

numberPageTile(
    {required Size size,
    required TextEditingController phoneNumbercontroller,
    required phoneNumberkey,
    required BuildContext context}) {
  return SingleChildScrollView(
    child: Container(
      height: size.height,
      width: size.width,
      decoration: BoxDecoration(
          image: DecorationImage(
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(
                AppColors.black.withOpacity(0.25),
                BlendMode.saturation,
              ),
              image:
                  const AssetImage('assets/images/Modern House Design.jpeg'))),
      child: SafeArea(
        child: Form(
          key: phoneNumberkey,
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
              Text('Forgot Password',
                  style: apptextstyle(
                      color: AppColors.white,
                      size: 35,
                      family: 'kalliyath1',
                      weight: FontWeight.w100)),
              SizedBox(
                height: size.height / 50,
              ),
              Padding(
                padding: const EdgeInsets.all(15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(' Enter Phone Number',
                        style: apptextstyle(
                            color: AppColors.white,
                            size: 12,
                            weight: FontWeight.w400,
                            family: 'kalliyath1')),
                    TextFormField(
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: phoneNumbercontroller,
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please enter phone number';
                        }

                        final RegExp regex = RegExp(r'^[0-9]+$');
                        if (!regex.hasMatch(value)) {
                          return 'Please enter valid phone number';
                        }
                        if (value.length != 10) {
                          return 'Phone number must be 10 digits';
                        }
                        return null;
                      },
                      inputFormatters: [LengthLimitingTextInputFormatter(10)],
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        filled: true,
                        fillColor: AppColors.white,
                        prefixIcon: const Icon(Icons.phone),
                        prefixText: '+91',
                        prefixStyle: const TextStyle(
                            color: AppColors.black, fontSize: 16.6),
                        hintText: 'Phone Number',
                        hintStyle: const TextStyle(
                            fontFamily: 'Kalliyath1',
                            fontSize: 15,
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
                        onTap: () async {
                          forgot(context, phoneNumberkey,
                              phoneNumbercontroller.text.trim());
                        },
                        child: Container(
                          height: size.height / 15,
                          width: size.width,
                          decoration: BoxDecoration(
                            color: AppColors.lightgreen,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Center(
                            child: Text('Verify',
                                style: apptextstyle(
                                    color: AppColors.white,
                                    size: 17,
                                    family: 'kalliyath1')),
                          ),
                        ),
                      ),
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
