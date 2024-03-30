import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/authentication/authentication.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/ForgotPassword/changePassTile.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/ForgotPassword/functions.dart';

class ForgotPhoneNumberPage extends StatelessWidget {
  ForgotPhoneNumberPage({super.key});
  TextEditingController phoneNumbercontroller = TextEditingController();
  GlobalKey<FormState> phoneNumberkey = GlobalKey<FormState>();
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
                    Colors.black.withOpacity(0.25),
                    BlendMode.saturation,
                  ),
                  image: const AssetImage(
                      'assets/images/Modern House Design.jpeg'))),
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
                  const Text(
                    'Forgot Password',
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
                          ' Enter Phone Number',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kalliyath1',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
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
                          inputFormatters: [
                            LengthLimitingTextInputFormatter(10)
                          ],
                          keyboardType: TextInputType.number,
                          decoration: InputDecoration(
                            filled: true,
                            fillColor: const Color.fromARGB(255, 240, 238, 238),
                            prefixIcon: const Icon(Icons.phone),
                            prefixText: '+91',
                            prefixStyle: const TextStyle(
                                color: Colors.black, fontSize: 16.6),
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
                            splashColor:
                                const Color.fromARGB(121, 129, 128, 128),
                            onTap: () async {
                              forgot(context, phoneNumberkey,
                                  phoneNumbercontroller.text.trim());
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
