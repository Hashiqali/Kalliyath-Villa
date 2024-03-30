import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/bloc/splash_login_bloc.dart';
import 'package:kalliyath_villa/Screens/splash&login/login&signup/ForgotPassword/functions.dart';

class ChangePasswordTile extends StatelessWidget {
  ChangePasswordTile({super.key, required this.phoneNumber});

  GlobalKey<FormState> ChangePasskey = GlobalKey<FormState>();
  String phoneNumber;
  TextEditingController newpasscontroller = TextEditingController();
  TextEditingController newRepasscontroller = TextEditingController();
  SplashLoginBloc _blocp = SplashLoginBloc();
  SplashLoginBloc _blocp1 = SplashLoginBloc();

  @override
  Widget build(BuildContext context) {
   
    final size = MediaQuery.of(context).size;
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
          child: SafeArea(
            child: Form(
              key: ChangePasskey,
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
                  SizedBox(
                    height: size.height / 8,
                  ),
                  const Text(
                    'New Password',
                    style: TextStyle(
                        fontFamily: 'Kalliyath1',
                        color: Colors.white,
                        fontSize: 35),
                  ),
                  SizedBox(
                    height: size.height / 900,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          ' Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 12,
                              fontFamily: 'Kalliyath1',
                              fontWeight: FontWeight.w400),
                        ),
                        BlocBuilder<SplashLoginBloc, SplashLoginState>(
                          bloc: _blocp,
                          builder: (context, state) {
                            bool istrue = true;
                            if (state is NotObscureText) {
                              istrue = false;
                            } else if (state is ObscureText) {
                              istrue = true;
                            }
                            return TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: newpasscontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: istrue,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _blocp.add(ObscureEvent(istrue: istrue));
                                    },
                                    icon: Icon(istrue
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 240, 238, 238),
                                hintText: 'Password',
                                hintStyle: const TextStyle(
                                    fontFamily: 'Kalliyath1',
                                    color: Color.fromARGB(210, 158, 158, 158)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                        ),
                        const Text(
                          ' Confirm Password',
                          style: TextStyle(
                              color: Colors.white,
                              fontFamily: 'Kalliyath1',
                              fontSize: 12,
                              fontWeight: FontWeight.w400),
                        ),
                        BlocBuilder<SplashLoginBloc, SplashLoginState>(
                          bloc: _blocp1,
                          builder: (context, state) {
                            bool istrue = true;
                            if (state is NotObscureText) {
                              istrue = false;
                            } else if (state is ObscureText) {
                              istrue = true;
                            }
                            return TextFormField(
                              autovalidateMode:
                                  AutovalidateMode.onUserInteraction,
                              controller: newRepasscontroller,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return 'Please Enter Password';
                                }
                                return null;
                              },
                              obscureText: istrue,
                              decoration: InputDecoration(
                                prefixIcon: const Icon(Icons.lock),
                                suffixIcon: IconButton(
                                    onPressed: () {
                                      _blocp1.add(ObscureEvent(istrue: istrue));
                                    },
                                    icon: Icon(istrue
                                        ? Icons.visibility
                                        : Icons.visibility_off)),
                                filled: true,
                                fillColor:
                                    const Color.fromARGB(255, 240, 238, 238),
                                hintText: 'Confirm Password',
                                hintStyle: const TextStyle(
                                    fontFamily: 'Kalliyath1',
                                    color: Color.fromARGB(210, 158, 158, 158)),
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                            );
                          },
                        ),
                        SizedBox(
                          height: size.height / 30,
                        ),
                        Material(
                          clipBehavior: Clip.hardEdge,
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.transparent,
                          child: InkWell(
                            splashColor:
                                const Color.fromARGB(121, 129, 128, 128),
                            onTap: () {
                              changePassword(
                                  context,
                                  ChangePasskey,
                                  newpasscontroller.text.trim(),
                                  newRepasscontroller.text.trim(),
                                  phoneNumber);
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
